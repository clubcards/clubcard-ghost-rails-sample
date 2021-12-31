require "http"

class SignupsController < ApplicationController
  def new
  end

  def create
    access_list = build_access_list

    access_intent = HTTP.post(
      "https://app.clubcard.dev/api/v1/access_intents",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }, json: {
        description: "Become a member of our Ghost",
        profile_name: "Clubcard demo",
        return_url: return_signups_url,
        access_list: build_access_list
      })

    redirect_to access_intent.parse["redirect_url"], allow_other_host: true
  end

  def return
    # Add someone to Ghost
  end

  private

    def build_access_list
      return [] if params[:contract_address].blank?

      [
        {
          contract_address: params[:contract_address]
        }
      ]
    end
end
