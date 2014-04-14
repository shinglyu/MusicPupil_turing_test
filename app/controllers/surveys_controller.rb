class SurveysController < ApplicationController
   layout "application"
   before_filter:authenticate, :only => [:index]

   def new
      p1TotalQCount= 20
      p2TotalQCount= 20
      p3TotalQCount= 20
      qCount = 5
      @p1_ids = (1..p1TotalQCount).to_a.sample(qCount) #0~1000 reserved fo part 1
      @p2_ids = (1001..1000+p2TotalQCount).to_a.sample(qCount)
      @p3_ids = (2001..2000+p3TotalQCount).to_a.sample(qCount)

      @survey = Survey.new
      @p1_ids.each do |id|
         @survey.p1answers.build(:qid => id)
      end
      @p2_ids.each do |id|
         @survey.p2answers.build(:qid => id)
      end
      @p3_ids.each do |id|
         @survey.p3answers.build(:qid => id)
      end
   end

   def create
      attrs =  params.require(:survey).permit(:level, :instrument, p1answers_attributes: [:qid, :ans], p2answers_attributes: [:qid, :ans], p3answers_attributes: [:qid, :ans])
      @survey = Survey.new(attrs)
      #@survey.p1answers.build(params[:survey][:p1answers])
      #@survey.p2answers.build(params[:survey][:p2answers])
      @survey.save
      #render text: params[:survey].inspect
      #answers = params[:survey].select {|key, value| key.to_s.match(/^q\d+/)}
      #redirect_to surveys_path
      redirect_to('/thankyou.html')
   end

   def index
      @surveys = Survey.all
   end


   helper_method :logged_in?

   def logged_in?
        session[:login]
   end
   
   private
   def authenticate
     login = authenticate_or_request_with_http_basic do |username, password|
        username == "admin" && password == "xjp4jp6au4a83"
     end
     session[:login] = login
   end
   
   def do_logout
     session[:login] = nil
   end
#     private
#
#     def survey_params
#        params.require(:survey).permit(:level, :years, :answers)
#     end
end
