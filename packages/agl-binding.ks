# NOTE: Copy this post section in your project customisation if
# you want to install some AGL binding at the first image boot up.
# Then, change 'helloworld-binding' with your binding.
%post
AGL_BINDING="\
	helloworld-binding \
"
echo "AGL_BINDING=\"$AGL_BINDING\"" >> /tmp/agl-binding-list
%end