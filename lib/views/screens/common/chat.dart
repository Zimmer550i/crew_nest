import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/utils/custom_list_handler.dart';
import 'package:crew_nest/utils/custom_svg.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "John Doe", actions: []),
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomListHandler(
              reverse: true,
              topPadding: false,
              endIndicator: "No more messages",
              children: [
                SafeArea(top: false, child: SizedBox(height: 38)),
                for (int i = 0; i < 50; i++) getMessage(i),
              ],
            ),
          ),
          Positioned(left: 20, right: 20, bottom: 0, child: inputBar()),
        ],
      ),
    );
  }

  Widget getMessage(int index) {
    //   final currentMessage = chat.messages[index];
    //   if (currentMessage.type == MessageType.offer) {
    //     if (currentMessage.offer?.status == "rejected" ||
    //         chat.rejectedOfferId.value == currentMessage.offer?.id) {
    //       return Padding(
    //         padding: EdgeInsets.symmetric(vertical: 16),
    //         child: Text(
    //           "Offer Rejected!",
    //           style: AppTexts.tsmr.copyWith(color: AppColors.gray.shade400),
    //         ),
    //       );
    //     }
    //     try {
    //       return Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 16),
    //         child: OfferWidget(offer: currentMessage.offer!),
    //       );
    //     } catch (e) {
    //       debugPrint(e.toString());
    //       return Padding(
    //         padding: EdgeInsets.symmetric(vertical: 16),
    //         child: Text(
    //           "Error Loading Offer!",
    //           style: AppTexts.tsmr.copyWith(color: AppColors.red),
    //         ),
    //       );
    //     }
    //   }

    //   String text = currentMessage.message ?? "";
    //   bool isRecieving = widget.chatMember.id == currentMessage.sender?.id;
    bool isRecieving = index % 2 == 0;

    if (isRecieving) {
      return recieveMessage(
        "text",
        hasPrev: true,
        hasNext: false,
      );
    } else {
      return sendMessage(
        "text",
        hasPrev: true,
        hasNext: false,
      );
    }
  }

  Widget recieveMessage(
    String? message, {
    // MessageModel? messageModel,
    bool hasPrev = false,
    bool hasNext = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: hasPrev ? 2 : 14),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.black.shade100,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                        topLeft: Radius.circular(hasPrev ? 4 : 18),
                        bottomLeft: Radius.circular(hasNext ? 4 : 18),
                      ),
                    ),
                    child: Text(message ?? "", style: TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  Widget sendMessage(
    String? messgae, {
    // MessageModel? messageModel,
    bool hasPrev = false,
    bool hasNext = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: hasPrev ? 2 : 14),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.blue.shade900,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        topRight: Radius.circular(hasPrev ? 4 : 18),
                        bottomRight: Radius.circular(hasNext ? 4 : 18),
                      ),
                    ),
                    child: Text(
                      messgae ?? "",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputBar() {
    return SafeArea(
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: Container(
              height: 50,
              padding: .symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.black.shade50,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: TextField(
                  style: AppTexts.tmdr,
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    hintStyle: AppTexts.tsmr.copyWith(
                      color: AppColors.black.shade200,
                    ),
                    isCollapsed: true,
                    isDense: true,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          CustomSvg(asset: "assets/icons/send.svg"),
        ],
      ),
    );
  }
}
