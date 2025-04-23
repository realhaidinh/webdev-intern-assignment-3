class GScoresController < ApplicationController
  def search
    @current_route = "search"
    @student = if params[:registration_number]
      Student.preload(:subject_scores).find_by(id: params[:registration_number])
    end
  end
  def report
    @current_route = "report"
    @subject_name = params[:subject_name] || "toan"
    @subject_score_levels = SubjectScore
    .where(subject_name: @subject_name)
    .group("CASE
      WHEN score >= 8 THEN '>=8 points'
      WHEN score < 8 AND score >= 6 THEN '8 points > && >=6 points'
      WHEN score < 6 AND score >= 4 THEN '6 points > && >=4 points'
      WHEN score < 4 THEN '<4 points' END")
    .count
    @subject_score_levels = {
      "<4 points" => @subject_score_levels["<4 points"],
      "6 points > && >=4 points" => @subject_score_levels["6 points > && >=4 points"],
      "8 points > && >=6 points" => @subject_score_levels["8 points > && >=6 points"],
      ">=8 points" => @subject_score_levels[">=8 points"]
    }
  end
  def top_ten
    @current_route = "top_ten"
    @top_ten = SubjectScore
    .select("student_id, avg(score) as avg_score")
    .where(subject_name: [ "toan", "vat_li", "hoa_hoc" ])
    .group(:student_id)
    .having("count(subject_id) = 3")
    .order("avg_score" => :desc)
    .limit(10)
    .load
  end
end
