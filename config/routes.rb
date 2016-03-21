Spree::Core::Engine.add_routes do
  get 'order/walletone_confirm/:id' => 'walletone#confirm', as: :walletone_confirm
end
