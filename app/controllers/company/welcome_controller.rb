class Company::WelcomeController < Company::BaseController
  def index
    @title = 'Home'
    @last_vacants = Vacant.order(created_at: :desc).limit(10)
  end

  def login
    @title = 'Iniciar Sesión'
  end
end
