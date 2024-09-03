import 'package:elminiawy/core/style/color/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.string(
                    emptyCatyIllustration,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ErrorInfo(
                title: "Empty Cart!",
                description:
                    "It seems like you haven't added anything to your cart yet. Let's find some great items to fill it up!",
                // button: you can pass your custom button,
                btnText: "Discover Products",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 400.w),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold, color: ColorManger.brunLight),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorManger.brunLight),
            ),
            const SizedBox(height: 16 * 2.5),
            button == null
                ? const SizedBox()
                : ElevatedButton(
                    onPressed: press,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: ColorManger.brun,
                        foregroundColor: ColorManger.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    child: Text(btnText ?? "Retry".toUpperCase()),
                  ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

const emptyCatyIllustration =
    '''<svg width="1080" height="1080" viewBox="0 0 1080 1080" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M317.66 588.18L398.66 421.52C400.848 417.024 404.732 413.582 409.457 411.948C414.182 410.315 419.363 410.625 423.86 412.81L587 492.12C589.228 493.203 591.221 494.714 592.864 496.567C594.508 498.42 595.771 500.579 596.58 502.92L680.12 744.53C680.931 746.871 681.273 749.35 681.126 751.823C680.979 754.297 680.346 756.717 679.263 758.946C678.18 761.175 676.669 763.168 674.815 764.813C672.962 766.457 670.802 767.72 668.46 768.53L423.42 853.26C421.079 854.071 418.6 854.413 416.127 854.266C413.653 854.119 411.233 853.486 409.004 852.403C406.775 851.32 404.781 849.809 403.137 847.955C401.492 846.101 400.229 843.942 399.42 841.6L316.78 602.6C315.972 600.256 315.634 597.777 315.785 595.302C315.936 592.828 316.573 590.408 317.66 588.18Z" fill="#D3D3D3"/>
<path d="M227.62 404.37C235.473 404.37 241.84 398.004 241.84 390.15C241.84 382.297 235.473 375.93 227.62 375.93C219.766 375.93 213.4 382.297 213.4 390.15C213.4 398.004 219.766 404.37 227.62 404.37Z" fill="#E2E2E2"/>
<path d="M210.13 466.28C219.79 466.28 227.62 458.449 227.62 448.79C227.62 439.13 219.79 431.3 210.13 431.3C200.471 431.3 192.64 439.13 192.64 448.79C192.64 458.449 200.471 466.28 210.13 466.28Z" fill="#E2E2E2"/>
<path d="M268.7 455.06C275.261 455.06 280.58 449.741 280.58 443.18C280.58 436.619 275.261 431.3 268.7 431.3C262.139 431.3 256.82 436.619 256.82 443.18C256.82 449.741 262.139 455.06 268.7 455.06Z" fill="#E2E2E2"/>
<path d="M873.634 827.901C879.806 823.044 880.872 814.104 876.015 807.932C871.158 801.76 862.218 800.694 856.046 805.551C849.875 810.408 848.809 819.348 853.665 825.52C858.522 831.691 867.462 832.757 873.634 827.901Z" fill="#E2E2E2"/>
<path d="M867.926 892.142C873.082 888.084 873.973 880.615 869.915 875.459C865.858 870.303 858.389 869.412 853.232 873.47C848.076 877.527 847.186 884.996 851.243 890.152C855.301 895.309 862.77 896.199 867.926 892.142Z" fill="#E2E2E2"/>
<path d="M366.66 511.86L454.77 330.63C457.148 325.739 461.372 321.992 466.512 320.214C471.652 318.436 477.288 318.773 482.18 321.15L659.59 407.4C662.012 408.579 664.178 410.224 665.964 412.24C667.75 414.256 669.121 416.604 670 419.15L760.84 681.89C761.724 684.436 762.098 687.132 761.939 689.823C761.781 692.513 761.094 695.146 759.917 697.571C758.74 699.996 757.097 702.165 755.082 703.955C753.066 705.744 750.717 707.119 748.17 708L481.67 800.11C476.53 801.886 470.895 801.548 466.005 799.17C461.114 796.792 457.368 792.569 455.59 787.43L365.73 527.53C363.95 522.39 364.284 516.753 366.66 511.86V511.86Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M505.133 436.587C520.009 431.444 527.9 415.216 522.757 400.34C517.615 385.463 501.386 377.573 486.51 382.715C471.633 387.858 463.743 404.086 468.885 418.963C474.028 433.839 490.257 441.73 505.133 436.587Z" stroke="#0E0E0E" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M498.49 410.9C428.49 153.56 311.49 262.2 404.88 404.33" stroke="#0E0E0E" stroke-width="9" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M824.1 241.202C825.272 241.202 826.227 241.602 826.967 242.404C827.769 243.144 828.169 244.099 828.169 245.271C828.169 246.442 827.769 247.429 826.967 248.23C826.227 248.97 825.272 249.34 824.1 249.34H809.673V263.674C809.673 264.846 809.273 265.832 808.471 266.634C807.731 267.435 806.776 267.836 805.604 267.836C804.433 267.836 803.446 267.435 802.645 266.634C801.905 265.832 801.535 264.846 801.535 263.674V249.34H787.108C785.937 249.34 784.95 248.97 784.149 248.23C783.409 247.429 783.039 246.442 783.039 245.271C783.039 244.099 783.409 243.144 784.149 242.404C784.95 241.602 785.937 241.202 787.108 241.202H801.535V226.775C801.535 225.603 801.905 224.648 802.645 223.908C803.446 223.106 804.433 222.706 805.604 222.706C806.776 222.706 807.731 223.106 808.471 223.908C809.273 224.648 809.673 225.603 809.673 226.775V241.202H824.1Z" fill="#727272"/>
<path d="M883.765 298.553C884.599 298.553 885.279 298.838 885.805 299.408C886.376 299.935 886.661 300.615 886.661 301.448C886.661 302.282 886.376 302.984 885.805 303.554C885.279 304.081 884.599 304.344 883.765 304.344H873.499V314.545C873.499 315.378 873.214 316.08 872.643 316.65C872.117 317.221 871.437 317.506 870.603 317.506C869.77 317.506 869.068 317.221 868.497 316.65C867.971 316.08 867.708 315.378 867.708 314.545V304.344H857.441C856.608 304.344 855.906 304.081 855.335 303.554C854.809 302.984 854.546 302.282 854.546 301.448C854.546 300.615 854.809 299.935 855.335 299.408C855.906 298.838 856.608 298.553 857.441 298.553H867.708V288.286C867.708 287.453 867.971 286.773 868.497 286.246C869.068 285.676 869.77 285.391 870.603 285.391C871.437 285.391 872.117 285.676 872.643 286.246C873.214 286.773 873.499 287.453 873.499 288.286V298.553H883.765Z" fill="#727272"/>
<path d="M830.805 354.275C832.549 354.275 833.971 354.872 835.072 356.065C836.265 357.166 836.862 358.588 836.862 360.332C836.862 362.076 836.265 363.544 835.072 364.737C833.971 365.838 832.549 366.389 830.805 366.389H809.332V387.724C809.332 389.468 808.735 390.936 807.542 392.129C806.441 393.322 805.019 393.919 803.275 393.919C801.531 393.919 800.063 393.322 798.87 392.129C797.769 390.936 797.218 389.468 797.218 387.724V366.389H775.745C774.001 366.389 772.533 365.838 771.34 364.737C770.239 363.544 769.688 362.076 769.688 360.332C769.688 358.588 770.239 357.166 771.34 356.065C772.533 354.872 774.001 354.275 775.745 354.275H797.218V332.802C797.218 331.058 797.769 329.636 798.87 328.535C800.063 327.342 801.531 326.745 803.275 326.745C805.019 326.745 806.441 327.342 807.542 328.535C808.735 329.636 809.332 331.058 809.332 332.802V354.275H830.805Z" fill="#727272"/>
<path d="M260.1 810.512C261.272 810.512 262.227 810.913 262.967 811.714C263.769 812.454 264.169 813.41 264.169 814.581C264.169 815.752 263.769 816.739 262.967 817.54C262.227 818.28 261.272 818.65 260.1 818.65H245.673V832.985C245.673 834.156 245.273 835.142 244.471 835.944C243.731 836.745 242.776 837.146 241.604 837.146C240.433 837.146 239.446 836.745 238.645 835.944C237.905 835.142 237.535 834.156 237.535 832.985V818.65H223.108C221.937 818.65 220.95 818.28 220.149 817.54C219.409 816.739 219.039 815.752 219.039 814.581C219.039 813.41 219.409 812.454 220.149 811.714C220.95 810.913 221.937 810.512 223.108 810.512H237.535V796.085C237.535 794.914 237.905 793.958 238.645 793.218C239.446 792.417 240.433 792.016 241.604 792.016C242.776 792.016 243.731 792.417 244.471 793.218C245.273 793.958 245.673 794.914 245.673 796.085V810.512H260.1Z" fill="#727272"/>
<path d="M319.765 867.863C320.599 867.863 321.279 868.148 321.805 868.718C322.376 869.245 322.661 869.925 322.661 870.758C322.661 871.592 322.376 872.294 321.805 872.864C321.279 873.391 320.599 873.654 319.765 873.654H309.499V883.855C309.499 884.688 309.214 885.39 308.643 885.961C308.117 886.531 307.437 886.816 306.603 886.816C305.77 886.816 305.068 886.531 304.497 885.961C303.971 885.39 303.708 884.688 303.708 883.855V873.654H293.441C292.608 873.654 291.906 873.391 291.335 872.864C290.809 872.294 290.546 871.592 290.546 870.758C290.546 869.925 290.809 869.245 291.335 868.718C291.906 868.148 292.608 867.863 293.441 867.863H303.708V857.596C303.708 856.763 303.971 856.083 304.497 855.556C305.068 854.986 305.77 854.701 306.603 854.701C307.437 854.701 308.117 854.986 308.643 855.556C309.214 856.083 309.499 856.763 309.499 857.596V867.863H319.765Z" fill="#727272"/>
<path d="M334.45 712.54C335.323 712.54 336.036 712.839 336.587 713.436C337.185 713.988 337.483 714.7 337.483 715.573C337.483 716.446 337.185 717.182 336.587 717.779C336.036 718.331 335.323 718.607 334.45 718.607H323.695V729.292C323.695 730.165 323.397 730.901 322.799 731.498C322.248 732.096 321.535 732.395 320.662 732.395C319.789 732.395 319.053 732.096 318.456 731.498C317.904 730.901 317.629 730.165 317.629 729.292V718.607H306.874C306.001 718.607 305.265 718.331 304.668 717.779C304.116 717.182 303.841 716.446 303.841 715.573C303.841 714.7 304.116 713.988 304.668 713.436C305.265 712.839 306.001 712.54 306.874 712.54H317.629V701.785C317.629 700.912 317.904 700.2 318.456 699.648C319.053 699.051 319.789 698.752 320.662 698.752C321.535 698.752 322.248 699.051 322.799 699.648C323.397 700.2 323.695 700.912 323.695 701.785V712.54H334.45Z" fill="#727272"/>
<path d="M698.8 638.55C739.454 638.55 772.41 605.594 772.41 564.94C772.41 524.286 739.454 491.33 698.8 491.33C658.146 491.33 625.19 524.286 625.19 564.94C625.19 605.594 658.146 638.55 698.8 638.55Z" fill="#ABABAB"/>
<path d="M728.145 560.276C729.889 560.276 731.311 560.872 732.412 562.065C733.605 563.166 734.202 564.589 734.202 566.332C734.202 568.076 733.605 569.544 732.412 570.737C731.311 571.838 729.889 572.389 728.145 572.389H706.672V593.725C706.672 595.468 706.075 596.936 704.882 598.129C703.781 599.322 702.359 599.919 700.615 599.919C698.872 599.919 697.403 599.322 696.211 598.129C695.109 596.936 694.559 595.468 694.559 593.725V572.389H673.085C671.342 572.389 669.873 571.838 668.681 570.737C667.579 569.544 667.029 568.076 667.029 566.332C667.029 564.589 667.579 563.166 668.681 562.065C669.873 560.872 671.342 560.276 673.085 560.276H694.559V538.802C694.559 537.059 695.109 535.636 696.211 534.535C697.403 533.342 698.872 532.746 700.615 532.746C702.359 532.746 703.781 533.342 704.882 534.535C706.075 535.636 706.672 537.059 706.672 538.802V560.276H728.145Z" fill="white"/>
<path d="M732.412 562.065L731.31 563.083L731.351 563.127L731.395 563.167L732.412 562.065ZM732.412 570.737L731.352 569.676L732.412 570.737ZM706.672 572.389V570.889H705.172V572.389H706.672ZM704.882 598.129L703.822 597.069L703.801 597.09L703.78 597.112L704.882 598.129ZM696.211 598.129L695.108 599.147L695.129 599.169L695.15 599.19L696.211 598.129ZM694.559 572.389H696.059V570.889H694.559V572.389ZM668.681 570.737L667.578 571.755L667.619 571.799L667.663 571.839L668.681 570.737ZM668.681 562.065L669.741 563.126H669.741L668.681 562.065ZM694.559 560.276V561.776H696.059V560.276H694.559ZM696.211 534.535L695.15 533.474H695.15L696.211 534.535ZM704.882 534.535L703.78 535.553L703.821 535.597L703.865 535.637L704.882 534.535ZM706.672 560.276H705.172V561.776H706.672V560.276ZM728.145 561.776C729.505 561.776 730.516 562.222 731.31 563.083L733.515 561.048C732.107 559.523 730.273 558.776 728.145 558.776V561.776ZM731.395 563.167C732.256 563.962 732.702 564.973 732.702 566.332H735.702C735.702 564.205 734.955 562.371 733.43 560.963L731.395 563.167ZM732.702 566.332C732.702 567.693 732.253 568.775 731.352 569.676L733.473 571.798C734.958 570.313 735.702 568.459 735.702 566.332H732.702ZM731.352 569.676C730.567 570.462 729.543 570.889 728.145 570.889V573.889C730.235 573.889 732.056 573.215 733.473 571.798L731.352 569.676ZM728.145 570.889H706.672V573.889H728.145V570.889ZM705.172 572.389V593.725H708.172V572.389H705.172ZM705.172 593.725C705.172 595.085 704.723 596.167 703.822 597.069L705.943 599.19C707.428 597.705 708.172 595.851 708.172 593.725H705.172ZM703.78 597.112C702.986 597.973 701.975 598.419 700.615 598.419V601.419C702.743 601.419 704.577 600.672 705.985 599.147L703.78 597.112ZM700.615 598.419C699.255 598.419 698.172 597.97 697.271 597.069L695.15 599.19C696.634 600.675 698.489 601.419 700.615 601.419V598.419ZM697.313 597.112C696.487 596.218 696.059 595.122 696.059 593.725H693.059C693.059 595.815 693.731 597.655 695.108 599.147L697.313 597.112ZM696.059 593.725V572.389H693.059V593.725H696.059ZM694.559 570.889H673.085V573.889H694.559V570.889ZM673.085 570.889C671.688 570.889 670.592 570.46 669.698 569.635L667.663 571.839C669.155 573.216 670.995 573.889 673.085 573.889V570.889ZM669.783 569.72C668.957 568.825 668.529 567.729 668.529 566.332H665.529C665.529 568.422 666.201 570.263 667.578 571.755L669.783 569.72ZM668.529 566.332C668.529 564.935 668.956 563.911 669.741 563.126L667.62 561.004C666.203 562.422 665.529 564.243 665.529 566.332H668.529ZM669.741 563.126C670.642 562.224 671.725 561.776 673.085 561.776V558.776C670.959 558.776 669.104 559.52 667.62 561.004L669.741 563.126ZM673.085 561.776H694.559V558.776H673.085V561.776ZM696.059 560.276V538.802H693.059V560.276H696.059ZM696.059 538.802C696.059 537.405 696.486 536.381 697.271 535.596L695.15 533.474C693.733 534.892 693.059 536.713 693.059 538.802H696.059ZM697.271 535.596C698.172 534.694 699.255 534.246 700.615 534.246V531.246C698.489 531.246 696.634 531.99 695.15 533.474L697.271 535.596ZM700.615 534.246C701.975 534.246 702.986 534.692 703.78 535.553L705.985 533.518C704.577 531.993 702.743 531.246 700.615 531.246V534.246ZM703.865 535.637C704.726 536.432 705.172 537.443 705.172 538.802H708.172C708.172 536.675 707.425 534.841 705.9 533.433L703.865 535.637ZM705.172 538.802V560.276H708.172V538.802H705.172ZM706.672 561.776H728.145V558.776H706.672V561.776Z" fill="#0E0E0E"/>
<path d="M698.8 638.55C739.454 638.55 772.41 605.594 772.41 564.94C772.41 524.286 739.454 491.33 698.8 491.33C658.146 491.33 625.19 524.286 625.19 564.94C625.19 605.594 658.146 638.55 698.8 638.55Z" stroke="#0E0E0E" stroke-width="3" stroke-miterlimit="10"/>
</svg>
''';
