class ScionsController < ApplicationController
  def new
  end

  def index
    @scions = Scion.order(created_at: :desc)
  end

  def create
    types = params[:animal_types]
    kupe_no = params['kupe_no']
    @scion = Scion.new(scion_params)
    if @scion.save
      if types.present?
        for type in types
          case type
            when "inek"
              @animals = Animal.inek
              for animal in @animals
                animal.scions << @scion
              end
            when "dana"
              @animals = Animal.dana
              for animal in @animals
                animal.scions << @scion
              end
            when "tosun"
              @animals = Animal.tosun
              for animal in @animals
                animal.scions << @scion
              end
            when "yok"
              @animals = Animal.yok
              for animal in @animals
                animal.scions << @scion
              end
          end
        end
      end
      if kupe_no.present?
        earring_nos= kupe_no.strip.split(/\s+/)
        for earring_no in earring_nos
          if Animal.exists?(earring_no: earring_no)
            @animal = Animal.find_by(earring_no: earring_no)
            @animal.scions << @scion
          end
        end
      end
      flash[:success] = "Yeni aşı oluşturuldu."
      redirect_to action: "index"
    else
      flash[:error] = "Bir hata meydana geldi. Lütfen tekrar deneyin."
      head :no_content
    end
  end

  def destroy
    @scion = Scion.find(params[:id])
    if(@scion.destroy)
      flash[:success] = "Aşı başarıyla silindi"
      redirect_to action: "index"
    else
      flash[:error] = "Bir hata meydana geldi. Lütfen tekrar deneyin."
      head :no_content
    end
  end

  private

  def scion_params
    params.require(:scion).permit(:name, :scion_date)
  end
end
