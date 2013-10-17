require "pundit_permissions_dsl/version"
require "pundit_permissions_dsl/engine"

module PunditPermissionsDSL
  module AuthorizationDSL

    include ActiveSupport::Concern

    def authorize(&block)
      auth = Authorization.new(&block)

      auth.controller_actions.each do |controller_action|
        define_method "#{controller_action}?" do
          auth.authorized? user, controller_action
        end
      end
    end

    class Authorization
      DEFAULT_ACTIONS = [:index, :new, :create, :show, :edit, :update, :destroy]

      def initialize(&block)
        @whitelist = Hash.new
        @actions = []
        instance_eval &block if block_given?
      end

      def actions(*actions)
        default = actions.delete(:default)
        @actions = actions.tap do |a|
          a.concat(DEFAULT_ACTIONS) if default
        end
      end

      def controller_actions
        @actions
      end

      def role(name, *actions)
        @whitelist[name] = actions
      end

      def actions_for(user)
        _, actions = @whitelist.find{ |role, _| user.public_send "#{role}?" }
        Array(actions)
      end

      def authorized?(user, controller_action)
        actions_for(user).any? do |action|
          [:any, :all, controller_action].include?(action.to_sym)
        end
      end

    end
  end
end
