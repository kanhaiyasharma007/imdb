require 'spec_helper'

describe ActorsController do
  context "GET index" do
    it "lists all the actors" do
      get :index
      expect(response).to render_template("index")
    end
  end


  context "GET show" do
    let(:actor) {FactoryGirl.create(:actor, :name => "actor1")}
     it "show the details of the actors" do
      get :show, {:id => actor.id}
      expect(response).to render_template("show")
     end
  end


  context "GET new" do
    let(:new_actor) {FactoryGirl.attributes_for(:actor)}
     it "display new form for adding actor" do
        post :new, {actor: new_actor}
        expect(response).to render_template("new")
     end
  end


  context "POST create" do
    let(:new_actor) {FactoryGirl.attributes_for(:actor)}
     it "creates a new actor" do
        post :create, {actor: new_actor}
        expect(response).to redirect_to(actors_path)
     end
     it " not arise" do
       post :create, {actor: new_actor}
       expect(response).not_to render_template("new")
     end
  end


  context "GET edit" do
    let(:new_actor) {FactoryGirl.create(:actor, :name => "actor1")}
    it "fetches the specific all the actors" do
      get :edit, {:id => new_actor.id}
      expect(response).to render_template("edit")
    end
  end


  context "DELETE delete" do
    let(:actor) {FactoryGirl.create(:actor, :name => "actor1")}
    it "delete an actor" do
    delete :destroy, {:id => actor.id}
    expect(response).to redirect_to(actors_path)
    end
  end


  context "PUT update" do
    let(:new_actor) {FactoryGirl.create(:actor, :name => "actor1")}
    it "updates details of specified actor" do
      patch :update, {:id =>new_actor.id, :actor => { :name => new_actor.name}}
      expect(response).to redirect_to(actors_path)
    end
    it " not arise" do
      put :update, {:id =>new_actor.id, :actor => { :name => new_actor.name}}
      expect(response).not_to render_template("edit")
    end
  end
end
