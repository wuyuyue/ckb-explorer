class LockScript < ApplicationRecord
  belongs_to :cell_output
  belongs_to :account

  validates_presence_of :binary_hash

  def binary_hash
    "#{ENV['DEFAULT_HASH_PREFIX']}#{super.unpack1('H*')}"
  end

  def binary_hash=(binary_hash)
    super([binary_hash[2..-1]].pack("H*"))
  end
end

# == Schema Information
#
# Table name: lock_scripts
#
#  id             :bigint(8)        not null, primary key
#  args           :string           is an Array
#  binary_hash    :binary
#  version        :integer
#  cell_output_id :bigint(8)
#  account_id     :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_lock_scripts_on_account_id      (account_id)
#  index_lock_scripts_on_cell_output_id  (cell_output_id)
#
