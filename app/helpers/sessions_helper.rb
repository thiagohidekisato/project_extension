module SessionsHelper
  # Logs in the given user.
  def log_in(professor)
    session[:professor_id] = professor.id
  end

  # Returns the current logged-in user (if any).
  def current_professor
    @current_professor ||= Professor.find_by(id: session[:professor_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_professor.nil?
  end

  def current_professor?(professor)
    professor == current_professor
  end

  # Logs out the current user.
  def log_out
    session.delete(:professor_id)
    @current_professor = nil
  end
end
