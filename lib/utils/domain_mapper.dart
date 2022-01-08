abstract class DomainMapper<T, DomainModel> {
  mapFromDomainModel(T model);
  mapToDomainModel(DomainModel model);
}
