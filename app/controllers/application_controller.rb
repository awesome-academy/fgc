class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :load_topic

  include SessionsHelper
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def load_topic
    @parent_topics = Topic.root_topics
                          .select_id_content
                          .alphabet_content
                          .eager_load(:sub_topics)
  end
end
