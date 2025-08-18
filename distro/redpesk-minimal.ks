%include ../features/binding.ks
%include ../features/project-features.ks
%include ../packages/project-apps.ks

%packages --exclude-weakdeps
#Application Framework
afb-binder
afb-app-manager
afb-app-manager-rpm
%end
