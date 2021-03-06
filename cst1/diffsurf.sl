surface
diffsurf
(
    float Ka=1,
          Kd=1,
          Kr=.5,
          Kt=.5,
          Kc=.3,
          eta=1.5
)
{
  normal Nn = normalize(N);
  vector In = normalize(I);

  vector v = faceforward(Nn, In);
  v = normalize(v);
  color local_illumination = Ka * ambient() + Kd * diffuse(Nn);

  Ci += Cs * local_illumination;
  Ci += indirectdiffuse(P, Nn, 1000);
  Ci += Kc * photonmap("causticrefl.cpm", P, N, "estimator", 400);
  /*Ci += caustic(P, Nn);*/
  Ci *= Os;
  Oi = Os;
}
