<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="DieuKhoan.aspx.cs" Inherits="WebNangCaoNhom5.DieuKhoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
        <script>
        $(function () {
            $(".menunav ul li").find("a").each(function () {
                $(this).removeClass("active");
            });
            $("#menunav ul li a .icon  ").find(".fa-shield").each(function () {
                $(this).parent(".icon").parent("a").addClass("active");
            });

        });
    </script>
    <div class="content">
        <div class="service">


            <h1>QUY CHẾ HOẠT ĐỘNG WEBSITE CUNG CẤP DỊCH VỤ TMĐT HIPHONE</h1>
            <h2>I.Nguyên tắc chung</h2>
            <p>
                - Website thương mại điện tử HIPHONE do công ty Cổ Phần Thế Giới Di Động (“Công ty”) thực hiện hoạt
                động và vận hành. Đối tượng phục vụ là tất cả khách hàng trên 63 tỉnh thành Việt Nam có nhu cầu mua
                hàng nhưng không có thời gian đến cửa hàng hoặc đặt trước để khi đến cửa hàng là đảm bảo có hàng.
                <p></p>
                - Sản phẩm được kinh doanh tại HIPHONE phải đáp ứng đầy đủ các quy định của pháp luật, không bán hàng
                nhái, hàng không rõ nguồn gốc, hàng xách tay.
                <p></p>
                - Hoạt động mua bán tại HIPHONE phải được thực hiện công khai, minh bạch, đảm bảo quyền lợi của người
                tiêu dùng.
            </p>
            <h2>II.Quy định chung</h2>
            <p>
                <b>Người bán</b> là công ty cổ phần Thế Giới Di Động.
                <p></p>
                <b>Người mua </b>là công dân Việt Nam trên khắp 63 tỉnh thành. Người mua có quyền đăng ký tài khoản
                hoặc không cần đăng ký để thực hiện giao dịch.
                <p></p>
                <b>Thành viên</b> là bao gồm cả người mua và người tham khảo thông tin, thảo luận tại website.
                <p></p>
                Nội dung bản Quy chế này tuân thủ theo các quy định hiện hành của Việt Nam. Thành viên khi tham gia
                website TMĐT HIPHONE phải tự tìm hiểu trách nhiệm pháp lý của mình đối với luật pháp hiện hành của Việt
                Nam và cam kết thực hiện đúng những nội dung trong Quy chế này.
            </p>
            <h2>III. Quy trình thanh toán</h2>
            <p>
                Người mua và bên bán có thể tham khảo các phương thức thanh toán sau đây và lựa chọn áp dụng phương
                thức phù hợp:
                <p></p>
                <b>Cách 1: Thanh toán trực tiếp (người mua nhận hàng tại địa chỉ bên bán):</b>
                <p></p>
                + Bước 1: Người mua tìm hiểu thông tin về sản phẩm, dịch vụ được đăng tin.
                <p></p>
                + Bước 2: Người mua đến địa chỉ bán hàng là các cửa hàng bán hàng của HIPHONE.
                <p></p>
                + Bước 3: Người mua thanh toán bằng tiền mặt, thẻ ATM nội địa hoặc thẻ tín dụng và nhận hàng.
                <p></p>
                <b>Cách 2: Thanh toán sau (COD – giao hàng và thu tiền tận nơi):</b>
                <p></p>
                + Bước 1: Người mua tìm hiểu thông tin về sản phẩm, dịch vụ được đăng tin.
                <p></p>
                + Bước 2: Người mua xác thực đơn hàng (điện thoại, tin nhắn, email).
                <p></p>
                + Bước 3: Người bán xác nhận thông tin Người mua.
                <p></p>
                + Bước 4: Người bán chuyển hàng.
                <p></p>
                + Bước 5: Người mua nhận hàng và thanh toán bằng tiền mặt, thẻ ATM nội địa hoặc thẻ tín dụng.
                <p></p>
                <b>Cách 3: Thanh toán online qua thẻ tín dụng, chuyển khoản:</b>
                <p></p>
                + Bước 1: Người mua tìm hiểu thông tin về sản phẩm, dịch vụ được đăng tin.
                <p></p>
                + Bước 2: Người mua xác thực đơn hàng (điện thoại, tin nhắn, email).
                <p></p>
                + Bước 3: Người bán xác nhận thông tin Người mua.
                <p></p>
                + Bước 4: Người mua thanh toán.
                <p></p>
                + Bước 5: Người bán chuyển hàng.
                <p></p>
                + Bước 6: Người mua nhận hàng.
            </p>
            <h2>IV. Đảm bảo an toàn giao dịch</h2>
            <p>
                Ban quản lý đã sử dụng các dịch vụ để bảo vệ thông tin về nội dung mà người bán đăng sản phẩm trên
                HIPHONE. Để đảm bảo các giao dịch được tiến hành thành công, hạn chế tối đa rủi ro có thể phát sinh.
                <p></p>
                Người mua nên cung cấp thông tin đầy đủ (tên, địa chỉ, số điện thoại, email) khi tham gia mua hàng của
                HIPHONE để HIPHONE có thể liên hệ nhanh lại với người mua trong trường hợp xảy ra lỗi.
                <p></p>
                Trong trường hợp giao dịch nhận hàng tại nhà của người mua, thì người mua chỉ nên thanh toán sau khi đã
                kiểm tra hàng hoá chi tiết và hài lòng với sản phẩm.
                <p></p>
                Khi thanh toán trực tuyến bằng thẻ ATM nội địa, Visa, Master người mua nên tự mình thực hiện và không
                được để lộ thông tin thẻ. HIPHONE không lưu trữ thông tin thẻ của người mua sau khi thanh toán, mà
                thông qua hệ thống của ngân hàng liên kết. Nên tuyệt đối bảo mật thông tin thẻ cho khách hàng.
                <p></p>
                Trong trường lỗi xảy ra trong quá trình thanh toán trực tuyến, HIPHONE sẽ là đơn vị giải quyết cho
                khách hàng trong vòng 1 giờ làm việc từ khi tiếp nhận thông tin từ người thực hiện giao dịch.
            </p>
            <h2>V. Trách nhiệm trong trường hợp phát sinh lỗi kỹ thuật</h2>
            <p>+ Website TMĐT HIPHONE cam kết nỗ lực đảm bảo sự an toàn và ổn định của toàn bộ hệ thống kỹ thuật. Tuy
                nhiên, trong trường hợp xảy ra sự cố do lỗi của HIPHONE, HIPHONE sẽ ngay lập tức áp dụng các biện pháp
                để đảm bảo quyền lợi cho người mua hàng.
                <p></p>
                + Khi thực hiện các giao dịch trên Sàn, bắt buộc các thành viên phải thực hiện đúng theo các quy trình
                hướng dẫn.
                <p></p>
                + Ban quản lý website TMĐT HIPHONE cam kết cung cấp chất lượng dịch vụ tốt nhất cho các thành viên tham
                gia giao dịch. Trường hợp phát sinh lỗi kỹ thuật, lỗi phần mềm hoặc các lỗi khách quan khác dẫn đến
                thành viên không thể tham gia giao dịch được thì các thành viên thông báo cho Ban quản lý website TMĐT
                qua địa chỉ email cskh@HIPHONE hoặc qua điện thoại 18001060 (từ 7:30 – 22:00 hằng ngày) chúng tôi sẽ
                khắc phục lỗi trong thời gian sớm nhất, tạo điều kiện cho các thành viên tham gia website TMĐT HIPHONE.
                <p></p>
                + Tuy nhiên, Ban quản lý website TMĐT HIPHONE sẽ không chịu trách nhiệm giải quyết trong trường hợp
                thông báo của các thành viên không đến được Ban quản lý, phát sinh từ lỗi kỹ thuật, lỗi đường truyền,
                phần mềm hoặc các lỗi khác không do Ban quản lý gây ra.</p>
            <h2>V.Điều khoản áp dụng</h2>
            <p>
                - Mọi tranh chấp phát sinh giữa Website TMĐT HIPHONE và thành viên sẽ được giải quyết trên cơ sở thương
                lượng. Trường hợp không đạt được thỏa thuận như mong muốn, một trong hai bên có quyền đưa vụ việc ra
                Tòa án nhân dân có thẩm quyền tại Thành phố Hà Nội để giải quyết.
                <p></p>
                - Quy chế của Website TMĐT HIPHONE chính thức có hiệu lực thi hành kể từ ngày ký Quyết định ban hành
                kèm theo Quy chế này. Website TMĐT HIPHONE có quyền và có thể thay đổi Quy chế này bằng cách thông báo
                lên Website TMĐT HIPHONE cho các thành viên biết. Quy chế sửa đổi có hiệu lực kể từ ngày Quyết định về
                việc sửa đổi Quy chế có hiệu lực. Việc thành viên tiếp tục sử dụng dịch vụ sau khi Quy chế sửa đổi được
                công bố và thực thi đồng nghĩa với việc họ đã chấp nhận Quy chế sửa đổi này.
            </p>
            <h2>VI. Điều khoản cam kết</h2>
            <p>
                Địa chỉ liên lạc chính thức của Website TMĐT HIPHONE:

                - Website TMĐT HIPHONE
                <p></p>
                - Công ty/Tổ chức : Công ty Cổ Phần HIPHONE
                <p></p>
                - Địa chỉ: 96 Định Công, Hoàng Mai, TP.Hà Nội
                <p></p>
                - Văn phòng: Phòng 51 ,Viện Đại học Mở Hà Nội - khoa Công Nghệ Thông Tin, Hoàng Mai, TP.Hà Nội.
                <p></p>
                - Tel: 028. 38125960
                <p></p>
                - Fax: 08. 38125961
                <p></p>
                - Email: cskh@HIPHONE</p>
        </div>
    </div>
</asp:Content>
