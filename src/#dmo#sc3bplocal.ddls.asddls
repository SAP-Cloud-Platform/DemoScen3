@AbapCatalog.sqlViewName: '/DMO/VSC3BPLOCAL'
@AccessControl.authorizationCheck: #CHECK
define view /DMO/SC3BPLOCAL
  as select from /dmo/tsc3bp
{
  key id,
      s4bpid,
      name,
      country,
      countrycode,
      postcode,
      city,
      road,
      housenumber
}
