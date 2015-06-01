class AddBlurbAndContactToUser < ActiveRecord::Migration

  def change
    add_column :users, :blurb, :string, default: "Eu putent convenire iudicabit est, illud everti bonorum usu ut. Nostro inermis eu mei, vel quodsi malorum salutatus id. Et tale possim eam, te illud facilisis disputando ius. Mel cu illud soleat, vix iusto mediocritatem id, ne vocent quaestio voluptaria mei. Primis prodesset delicatissimi at eum, lobortis torquatos mel an. Eu prima civibus neglegentur sed."
    add_column :users, :show_my_contact_info, :boolean, default: false
  end

end