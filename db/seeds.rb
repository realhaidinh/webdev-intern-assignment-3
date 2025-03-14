# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "benchmark"

puts Benchmark.realtime {
  file_path = "diem_thi_thpt_2024.csv"
  subject_scores = []
  students = []
  CSV.open(file_path, headers: true).each do |row|
      student_scores = row.to_h.reject { |header, v|
        header == "sbd" || header == "ma_ngoai_ngu" || v == nil
      }
      students << { id: row["sbd"], foreign_lang_id: row["ma_ngoai_ngu"] }

      student_scores.each { |subject_name, score|
        subject_scores << { student_id: row["sbd"], subject_name: subject_name, score: score }
      }
  end
  students.each_slice(100000) do |s|
    Student.insert_all(s)
  end
  subject_scores.each_slice(100000) do |scores|
    SubjectScore.insert_all(scores)
  end
}
