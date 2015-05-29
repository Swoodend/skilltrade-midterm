class Learnable < Relationship

  scope :with_skill_ids, ->(skills_id_array) { where(skill_id: skills_id_array) }

end