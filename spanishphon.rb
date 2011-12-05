# encoding: UTF-8
require 'rubygems'
require 'sinatra'


class Spanishphon < Sinatra::Base
  
  get '/' do
    redirect to('/exercises/1')
  end
  
  get '/exercises/:id' do
    @header = HEADERS[params[:id]]
    haml "exercises/#{params[:id]}".to_sym
  end
  
  not_found do
    redirect to('/exercises/1')
  end
    
  helpers do
    def navigation_link_class(link_id)
      return "current" if params[:id].to_s == link_id.to_s
    end
    
    def link_to_exercise(ex_id, name)
      haml "%a{:href => '/exercises/#{ex_id}', :class => '#{navigation_link_class(ex_id)}'} #{ex_id}. #{name}"
    end
    
    def player
      track_id = TRACKS[params[:id].to_s]
      "<iframe width='100%' height='166' scrolling='no frameborder='no' src='http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{track_id}&amp;auto_play=false&amp;show_artwork=false&amp;color=ff7700'></iframe>"
      
      
    end
  end
  
  TRACKS = {"29"=>29793816, "30"=>29793817, "31"=>29793819, "26"=>29793812, "27"=>29793813, "28"=>29793814, "24"=>29793542, "25"=>29793544, "21"=>29793539, "22"=>29793540, "23"=>29793541, "16"=>29792881, "17"=>29792882, "18"=>29792883, "19"=>29792884, "20"=>29792885, "15"=>29792662, "10-1"=>29781093, "10-2"=>29781094, "10"=>29792656, "11"=>29792657, "12"=>29792658, "13"=>29792659, "14"=>29792660, "3"=>29789226, "1"=>29785878, "6"=>29781089, "7"=>29781090, "8"=>29781091, "9"=>29781092, "2"=>29781084, "4"=>29781086, "5"=>29781088}
  
  HEADERS = {"1" => "Consonante [s]", "2" => "Consonante [r]","3" => "Consonante [θ]","4" => "Consonante [r:]","5" => "Consonante[ĉ]","6" => "Consonante [j]","7" => "Consonante[β]","8" => "Consonante [ð]", "9" => "Consonante[<em>ɣ</em>]",    '10-1' => "Consonante [λ]", '10-2' => "Consonante [λ – l]", "11" =>     "[λ – ĉ – j]", "12" =>     "Consonante[ɲ]", "13" =>     "Комплекс звуков", "14" =>     "Diptongos", "15" =>     "Triptongos", "16" =>     "Consonante [χ]", "17" =>     "Комплекс звуков", "18" =>     "Интонация полного перечисления", "19" => "Интонация неполного перечисления", "20" =>     "Альтернативный вопрос", "21" =>     "Окончания причастий на –ado", "22" =>     "Вопросы и ответы", "23" =>     "Вопросы и ответы", "24" =>     "Dialogos","25" =>     "Урок 1","26" =>     "Урок 2","27" =>     "Урок 3","28" =>     'Poesia "El sol es ..."',"29" =>     'Texto "Aquel verano ..."',"30" =>     'Texto "En efecto ..."',"31" =>     'Texto "Había una vez ..."'}
  
end

