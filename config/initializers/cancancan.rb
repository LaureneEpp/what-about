# if defined?(CanCanCan)
#   class Object
#     def metaclass
#       class << self
#         self
#       end
#     end
#   end

#   module CanCan
#     module ModelAdapters
#       class ActiveRecord4Adapter < AbstractAdapter
#         @@friendly_support = {}

#         def self.find(model_class, id)
#           klass =
#             (
#               if model_class.metaclass.ancestors.include?(
#                    ActiveRecord::Associations::CollectionProxy,
#                  )
#                 model_class.klass
#               else
#                 model_class
#               end
#             )
#           @@friendly_support[klass] ||= klass.metaclass.ancestors.include?(
#             FriendlyId,
#           )
#           if @@friendly_support[klass] == true
#             model_class.friendly.find(id)
#           else
#             model_class.find(id)
#           end
#         end
#       end
#     end
#   end
# end
