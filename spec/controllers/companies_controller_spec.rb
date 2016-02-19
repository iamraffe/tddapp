require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let(:create_company){create(:company)}

  context "get #index" do
    context "No company exists" do
      before(:each) do
        get :index
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders thw show template" do
        expect(response).to render_template("index")
      end

      it "gets the right company" do
        expect(assigns(:companies)).to eq([])
      end
    end

    context "Only one company exists" do
      before(:each) do
        @company = create_company
        get :index
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders thw show template" do
        expect(response).to render_template("index")
      end

      it "gets the right company" do
        expect(assigns(:companies)).to eq([@company])
      end
    end

    context "N companies exists" do
      before(:each) do
        @companies = []
        2.times do |i|
          @companies.push(create(:company))
        end
        get :index
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders thw show template" do
        expect(response).to render_template("index")
      end

      it "gets the right company" do
        expect(assigns(:companies)).to eq(@companies)
      end
    end
  end

  context "get #show" do
    context "The company exists" do
      before(:each) do
        @company = create_company
        get :show, {id: @company.id}
      end

      it "responds successfully with an HTTP 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders thw show template" do
        expect(response).to render_template("show")
      end

      it "gets the right company" do
        expect(assigns(:company)).to eq(@company)
      end
    end
  end
end
