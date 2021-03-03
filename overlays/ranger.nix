self: super: {

  ranger = super.ranger.overrideDerivation(old: {
    src = /home/milan/dev/ranger;
  });

}
