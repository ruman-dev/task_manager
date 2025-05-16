import 'package:task_manager/core/utils/exports/exports.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'My Tasks', autoLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _homeController.taskList.length,
                  itemBuilder: (context, index) {
                    final task = _homeController.taskList[index];
                    final item = task['id'].toString();
                    return Dismissible(
                      key: ValueKey(task['id']),
                      background: Container(
                        color: Colors.green,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          _homeController.editItem(context, task['title']);
                          return false;
                        } else if (direction == DismissDirection.endToStart) {
                          bool confirm = await _homeController.confirmDelete(
                            context,
                            item,
                          );
                          return confirm;
                        }
                        return false;
                      },
                      onDismissed: (direction) {
                        _homeController.box.deleteAt(index);
                        _homeController.taskList.removeAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${task['title']} deleted')),
                        );
                      },

                      child: ListItem(task: task),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddTaskWidget(),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.task});

  final dynamic task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xFFA362EA),
        border: Border.all(color: Color(0xFFA362EA)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          TopListItemWidget(task: task),
          const SizedBox(height: 15),
          BottomListItemWidget(task: task),
        ],
      ),
    );
  }
}

class TopListItemWidget extends StatelessWidget {
  const TopListItemWidget({super.key, required this.task});

  final dynamic task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: task['title'],
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              CustomText(
                text: task['description'],
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(Icons.check, color: AppColors.primaryColor, size: 20),
        ),
      ],
    );
  }
}

class BottomListItemWidget extends StatelessWidget {
  const BottomListItemWidget({super.key, required this.task});

  final dynamic task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: task['date'],
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Color(0xFFD8AFFF),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        CustomText(
          text: task['status'] == 'Completed' ? 'COMPLETED!' : 'PENDING',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white.withValues(alpha: 0.5),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(AppRouteNames().createTask),
      backgroundColor: AppColors.primaryColor,
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    );
  }
}
