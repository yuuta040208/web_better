class CreateOreproPredictions < ActiveRecord::Migration[6.0]
  def change
    create_table :orepro_predictions, comment: '俺プロ予想' do |t|
      t.string :race_id, null: false, comment: 'netkeibaレースID'
      t.string :email, null: false, comment: 'メールアドレス'
      t.integer :honmei, null: false, comment: '本命の馬番'
      t.integer :taikou, null: true, comment: '対抗の馬番'
      t.integer :tanana, null: true, comment: '単穴の馬番'
      t.string :renkas, null: true, comment: '連下の馬番（複数）'
    end
  end
end
