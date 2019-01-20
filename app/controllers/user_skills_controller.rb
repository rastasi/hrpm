class UserSkillsController < ApplicationController
  def export
    filename = "user-skills-#{Date.today}.xlsx"
    file_path = "#{Rails.root}/tmp/#{filename}"
    build_package.serialize file_path
    send_file file_path, filename: filename, type: "application/xlsx"
  end

  private

  def build_package
    package = Axlsx::Package.new
    package.workbook.add_worksheet(:name => 'Skills') do |sheet|
      sheet.add_row %w{ID Name Skills}
      User.all.each do |user|
        build_row user, sheet
      end
    end
    package.use_shared_strings = true
    package
  end

  def build_row user, sheet
    row = []
    row.push user.id.to_s
    row.push user.name.to_s
    row.push user.user_skills.all.map { |us| "#{us.skill.name} (#{us.level})" }.join(', ').to_s
    sheet.add_row row
  end
end