module ServicesHelper
  def current_user_companies
    arr = Company.all
    user_companies = []
    arr.each do |el|
      if el.user_id == current_user.id
        user_companies.push(el)
      end
    end
    user_companies
  end

  def find_company_by_name(name)
    arr = Company.all
    company = []
    arr.each do |el|
      if name == el.name
        company.push(el.id)
      end
    end
    company[0]
  end
end
