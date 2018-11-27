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

  def destroy_scion
    animal_id = params[:id]
    scion_id = params[:scion_id]
    if AnimalScion.exists?(scion_id: scion_id, animal_id: animal_id)
      @animal_scion = AnimalScion.find_by(scion_id: scion_id, animal_id: animal_id)
      if @animal_scion.destroy
        flash[:success] = "Aşı kaydı başarıyla silindi."
        redirect_to animal_path
      else
        flash[:error] = "Bir hata meydana geldi. Lütfen tekrar deneyin."
        redirect_to animal_path
      end
    else
      flash[:error] = "Bir hata meydana geldi. Lütfen tekrar deneyin."
      head :no_content
      redirect_to animal_path
    end
  end

  def search
    if request.post?
        earring_no = params[:earring_no]
      if Animal.exists?(earring_no: earring_no)
        @animal = Animal.find_by(earring_no: earring_no)
        flash[:success] = "Bir kayıt bulundu"
        flash[:error] = nil
      else
        flash[:success] = nil
        flash[:error] = "Herhangi bir kayıt bulunamadı."
      end
    else
    end
  end

  def index
    @animals = Animal.where.not(animal_type: 'yok').order(created_at: :desc).paginate(page: params[:page], per_page: 40)
    animals_count
    respond_to do |format|
      format.html
      format.pdf {
        render pdf: "#{DateTime.now.to_date}-gulec-tarim-butun-hayvanlar", page_size: 'A2'
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
    p params['calves_attributes']
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
    animals_count
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-inekler.xlsx'"
      }
    end
  end

  def bullock
    @animals = Animal.tosun.order(created_at: :desc).paginate(page: params[:page], per_page: 40)
    animals_count
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-tosunlar.xlsx'"
      }
    end
  end

  def calf
    @animals = Animal.dana.order(created_at: :desc).paginate(page: params[:page], per_page: 40)
    animals_count
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-danalar.xlsx'"
      }
    end
  end

  def no_exist
    @animals = Animal.yok.order(created_at: :desc).paginate(page: params[:page], per_page: 40)
    animals_count
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = "attachment; filename='#{DateTime.now.to_date}-varolmayanlar.xlsx'"
      }
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :animal_type, :image, :mother_image, :state, :earring_no, :picture, :mating_date, :gender, :mother_earring_no, :birthdate, :picture_of_mother, :race, calves_attributes: [:id, :image, :info, :earring_no, :birthdate, :_destroy])
  end

  def animals_count
    @animals_count = @animals.count
  end
end
