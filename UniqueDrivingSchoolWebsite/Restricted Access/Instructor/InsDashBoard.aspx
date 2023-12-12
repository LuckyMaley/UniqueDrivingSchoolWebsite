<%@ Page Title="" Language="C#" MasterPageFile="~/Restricted Access/Instructor/Site2.Master" AutoEventWireup="true" CodeBehind="InsDashBoard.aspx.cs" Inherits="UniqueDrivingSchoolWebsite.Restricted_Access.Instructor.InsDashBoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="width: 100%">
    
    <div align="center" style="width: 100%; ">

        <div class="slide" style="width: 100%; height: 510px;" align="center">
            
                <div class="container-fluid" align="center">
                    <div class="row2 img-rounded" align="center" style="width: 100%">
                        <div id="carousel-example-generic" class="carousel slide img-rounded" data-ride="carousel">
                        
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner" align="center">
                                
                                <div class="item active">
                                    <asp:image runat="server" Height="500px" ImageAlign="Middle" 
                                        ImageUrl="~/Resources/slides/p1.jpg" Width="100%" CssClass="img-rounded"></asp:image>
                                </div>
                                <div class="item">
                                    <asp:image runat="server" Height="500px" ImageAlign="Middle" 
                                        ImageUrl="~/Resources/slides/p2.jpg" CssClass="img-rounded" Width="100%"></asp:image>
                                </div>
                                <div class="item">
                                    <asp:image runat="server" Height="500px" CssClass="img-rounded" ImageAlign="Middle" 
                                        ImageUrl="~/Resources/slides/p3.jpg" Width="100%"></asp:image>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                                    href="#carousel-example-generic" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                                    </span></a>
                        </div>
                    </div>
                </div>
                </div>
         
    <div align="center" class="img-rounded">
        <div style="width: 50%; float: left">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
                Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
                Width="371px" onselectionchanged="Calendar1_SelectionChanged">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                    Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                    Font-Size="12pt" ForeColor="White" Height="12pt" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
            </asp:Calendar>
            
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
                Height="68px" Width="366px" AutoGenerateColumns="False" BackColor="White" 
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="LessonNumber" HeaderText="Lesson" 
                        SortExpression="LessonNumber"></asp:BoundField>
                    <asp:BoundField DataField="LessonDate" HeaderText="Date" 
                        SortExpression="LessonDate" DataFormatString="{0:d/M/yyyy}"></asp:BoundField>
                    <asp:BoundField DataField="LessonTime" HeaderText="Time" 
                        SortExpression="LessonTime" DataFormatString="{0:t}"></asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />

<SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#0000A9"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#000065"></SortedDescendingHeaderStyle>
            </asp:GridView>
            
            <asp:Label ID="Label6" runat="server" Text="Label" Visible="False"></asp:Label>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT LessonNumber, LessonDate, LessonTime FROM Booking WHERE (LessonDate = @LessonDate) AND (InstructorID = @InstructorID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Calendar1" Name="LessonDate" 
                        PropertyName="SelectedDate" />
                    <asp:ControlParameter ControlID="Label6" Name="InstructorID" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <div align="center" 
                style="font-family: 'Arial Rounded MT Bold'; font-size: x-large">
            </div>
            
        </div>
        
        <div style="width: 47%; float: left; font-family: 'Arial Rounded MT Bold'; font-size: xx-large; font-weight: bold;" 
            align="left"><asp:Label ID="Label1" runat="server" Text="Instructor Name:"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            
            
            <br />
            <asp:Label ID="Label4" runat="server" Text="Lessons today:"></asp:Label>
            <asp:Label ID="Label5" runat="server" Text="0"></asp:Label>
            
            </div>
            </div>
    </div>
    </div>
    <div class="content3" align="center"></div>
</asp:Content>
