class AnimalsController < ApplicationController
  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def index
    @animals = Animal.order(created_at: :desc).paginate(page: params[:page], per_page: 40)

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-gulec-tarim-butun-hayvanlar.xlsx'"
      }
    end
  end

  def create
    @animal = Animal.new(animal_params)
    if(@animal.save)
      redirect_to @animal
      flash[:success] = "Yeni hayvan oluşturuldu."
    else
      flash[:error] = "Kayıt oluşturulamadı. Hataları kontrol edip tekrar deneyiniz."
      render 'new'
    end
  end

  def update
    @animal = Animal.find(params[:id])
    if(@animal.update(animal_params))
      redirect_to @animal
      flash[:success] = "Kayıt başarıyla güncellendi."
    else
      flash[:error] = "Kayıt güncellenirken bir hata oluştu. Lütfen kontrol edip tekrar deneyiniz."
      render 'edit'
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
      flash[:success] = "Kayıt başarıyla silindi."
      redirect_to animals_path
    else
      flash[:notice] = "Kayıt başarıyla silindi."
    end
  end

  def cow
    @animals = Animal.inek.order(created_at: :desc).paginate(page: params[:page], per_page: 40)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-inekler.xlsx'"
      }
    end
  end

  def bullock
    @animals = Animal.tosun.order(created_at: :desc).paginate(page: params[:page], per_page: 40)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-tosunlar.xlsx'"
      }
    end
  end

  def calf
    @animals = Animal.dana.order(created_at: :desc).paginate(page: params[:page], per_page: 40)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-danalar.xlsx'"
      }
    end
  end

  def no_exist
    @animals = Animal.yok.order(created_at: :desc).paginate(page: params[:page], per_page: 40)
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-varolmayanlar.xlsx'"
      }
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :animal_type, :image, :mother_image, :state, :earring_no, :picture, :mating_date, :gender, :mother_earring_no, :birthdate, :picture_of_mother, calves_attributes: [:id, :image, :_destroy])
  end

  def paginate
  end
end
