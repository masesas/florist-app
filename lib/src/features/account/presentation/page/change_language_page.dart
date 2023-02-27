part of 'pages.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<LanguageCubit>(),
      child: Scaffold(
          backgroundColor: AppColors.colorBackground,
          appBar: AppBarForm(
            title: context.lang.language,
            /* actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  context.lang.done,
                  style: AppStyles.fontBold14.copyWith(
                    color: AppColors.buttonColor,
                  ),
                ),
              ),
            ],*/
          ),
          body: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (_, state) {
              final country = state.language;
              final countries = state.languageList;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: countries
                      .map(
                        (lang) => Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildItem(
                              context,
                              lang: lang,
                              isSelected: lang.id == country.id,
                            ),
                            const Divider(
                              color: AppColors.colorBackgroundGrey,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              );
            },
          )),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required LanguageEntity lang,
    required bool isSelected,
  }) {
    return ListTile(
      onTap: () {
        context.read<LanguageCubit>().changeLanguage(lang);
      },
      leading: lang.image,
      trailing: isSelected
          ? const Icon(
              Icons.check,
              color: AppColors.buttonColor,
            )
          : null,
      title: Text(
        lang.name,
        style: AppStyles.fontBold16.copyWith(
          color: isSelected ? AppColors.buttonColor : AppColors.textColor,
        ),
      ),
    );
  }
}
