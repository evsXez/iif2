class AccountOptions {
  final bool isArchiveAvailable;
  final bool isDeleteAvailable;
  final bool isArchiveVisible;
  final bool isDeleteVisible;
  final bool isEditVisible;

  AccountOptions({
    this.isArchiveAvailable = false,
    this.isDeleteAvailable = false,
    this.isArchiveVisible = true,
    this.isDeleteVisible = true,
    this.isEditVisible = true,
  });
}
