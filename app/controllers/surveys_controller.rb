class SurveysController < ApplicationController
   def new
      p1TotalQCount= 20
      #p2TotalQCount= 20
      qCount = 5
      @p1_ids = (1..p1TotalQCount).to_a.sample(qCount) #0~1000 reserved fo part 1
      #@p2_ids = (1001..1000+p2TotalQCount).to_a.sample(qCount)

      @survey = Survey.new
      @p1_ids.each do |id|
         @survey.answers.build(:qid => id)
      end
      #@p2_ids.each do |id|
      #   @survey.answers.build(:qid => id)
      #qCount.times { @survey.answers.build(qid)}
      #end
   end

   def create
      attrs =  params.require(:survey).permit(:level, :years, answers_attributes: [:qid, :ans])
      @survey = Survey.new(attrs)
      @survey.answers.build(params[:survey][:answers])
      @survey.save
      #render text: params[:survey].inspect
      #answers = params[:survey].select {|key, value| key.to_s.match(/^q\d+/)}
      redirect_to surveys_path
   end

   def index
      @surveys = Survey.all
   end
#     private
#
#     def survey_params
#        params.require(:survey).permit(:level, :years, :answers)
#     end
end
