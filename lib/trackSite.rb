require 'nokogiri'
require 'open-uri'

class TrackHelper

  def initialize
    scratchExercisePage
  end#end initialize

  def chooseRandPage
    @baseSite = "http://www.jefit.com/exercises/bodypart.php?id=11&exercises=All&All=0&Bands=0&Bench=0&Dumbbell=0&EZBar=0&Kettlebell=0&MachineStrength=0&MachineCardio=0&Barbell=0&BodyOnly=0&ExerciseBall=0&FoamRoll=0&PullBar=0&WeightPlate=0&Other=0&Strength=0&Stretching=0&Powerlifting=0&OlympicWeightLifting=0&Beginner=0&Intermediate=0&Expert=0&page="
    @baseSite.split
    rand_int = rand(1..130)
    rand_int = rand_int.to_s
    rand_int.split
    @baseSite.concat(rand_int)
    @baseSite
  end#end chooseRandPage

  def chosenPage
    @baseSite
  end

  def chooseRandExercise
    mainSite = open(chooseRandPage)
    @nokogiri_doc = Nokogiri::HTML(mainSite)
    chosenExerciseArray = @nokogiri_doc.css("h3  a")
    exerciseLinksArray =[]
    chosenExerciseArray.each do |item|
      exerciseLinksArray << item.attr("href")
    end#end each iteration
    chosenExercise = exerciseLinksArray.sample
    @chosenExerciseLink = "http://www.jefit.com/exercises/" + chosenExercise
    @exerciseName = chosenExercise.split("/")
    @exerciseName = @exerciseName.last
    @chosenExerciseLink
  end#end chooseRandExercise

  def chosenExerciseLink
    @chosenExerciseLink
  end

  def exerciseName
    @exerciseName
  end

   def scratchExercisePage
     exerciseSite = open(chooseRandExercise)  
     @nokogiri_exercise_doc = Nokogiri::HTML(exerciseSite) 
     image =@nokogiri_exercise_doc.css("td.MiddleColumn tr p a img")[0].attr("src")
     image = image.split("..")
     image.delete_at(0)
     image.delete_at(0)
     image.delete_at(0)
     image = image.join
     image.gsub!(".jpg", "")
     image = image.split("/")
     @image1_num = image[-1].to_i
     puts image
     image = image.join("/")
    @image1 = "http://www.jefit.com" + image
     image =@nokogiri_exercise_doc.css("td.MiddleColumn tr p a img")[1].attr("src")
     image = image.split("..")
     image.delete_at(0)
     image.delete_at(0)
     image.delete_at(0)
     image = image.join
     image.gsub!(".jpg", "")
     image = image.split("/")
     @image2_num = image[-1].to_i
     puts image
     image = image.join("/")
    @image2 = "http://www.jefit.com" + image
    @image1
    @image2
    @steps = @nokogiri_exercise_doc.css("td.textPadding").text.split("\n")
    @steps
    #checkAmountOfImages
   end

   def imageLink1
    @image1 + ".jpg"
   end

   def imageLink2
    @image2 + ".jpg"
   end

   def steps
    @steps
   end

   def image1_num
    @image1_num
   end

   def image2_num
    @image2_num
   end

end#end TrackHelper class


 #track = TrackHelper.new
# puts "------------"
# puts track.chosenPage
# puts "------------"
# puts track.exerciseName
# puts "------------"
# puts track.chosenExerciseLink
# puts "------------"
# puts track.imageLink1
# puts "------------"
# puts track.imageLink2
# puts "------------"
#track.steps
##hor-minimalist_3 > tbody > tr > td > table > tbody > tr:nth-child(1) > td:nth-child(2) > h3 > a
##hor-minimalist_3 > tbody > tr > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > h3 > a