class Admin::UsuariosController < Admin::BaseController
  before_action :set_usuario, only: [:edit, :update, :destroy]

  def index
    @usuarios = Usuario
      .order(:nome)
      .page(params[:page])
  end

  def new
    @usuario = Usuario.new
  end

  def edit
    render file: 'public/404.html', status: :not_found, layout: false if @usuario != current_usuario
  end

  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      redirect_to usuarios_path, notice: 'Usuário criado.'
    else
      render :new, alert: 'Falha ao criar usuário.'
    end
  end

  def update
    if @usuario.update_with_password(usuario_params)
      redirect_to usuarios_path, notice: 'Usuário atualizado.'
    else
      render :edit, alert: 'Falha ao atualizar usuário.'
    end
  end

  def destroy
    if @usuario == current_usuario
      redirect_to usuarios_path, notice: 'Não é possível se autoexcluir.'
    elsif @usuario.destroy
      redirect_to usuarios_path, notice: 'Usuário excluído com sucesso.'
    else
      redirect_to usuarios_path, alert: 'Falha ao excluir usuário.'
    end
  end

  private

  def usuario_params
    result = params.require(:usuario).permit(:id, :nome, :email, :password, :password_confirmation, :current_password)

    if result[:password].blank? && (result[:id].blank? || result[:id] != current_usuario.id.to_s)
      result.delete(:password)
      result.delete(:password_confirmation)
    end

    result
  end

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
