class SubjectScore < ApplicationRecord
  belongs_to :student

  def self.format_name(name)
    @subject_name_mapper[name]
  end
  def self.get_name_mapper
    @subject_name_mapper
  end
  private
  @subject_name_mapper = {
    "toan" => "Math",
    "ngu_van" => "Literatue",
    "ngoai_ngu" => "Foreign Language",
    "vat_li" => "Physics",
    "hoa_hoc" => "Chemical",
    "sinh_hoc" => "Biology",
    "lich_su" => "History",
    "dia_li" => "Geography",
    "gdcd" => "Civic Education"
  }
end
