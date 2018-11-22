unit holemanager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, ExtCtrls, DBGridEh, Menus, DB, ADODB, common;

type
  TForm4 = class(TForm)
    pM: TPanel;
    PMEDIT: TPanel;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    StringGrid2: TStringGrid;
    N4: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Edit2: TEdit;
    Memo1: TMemo;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button2: TButton;
    Edit10: TEdit;
    Label11: TLabel;
    ComboBox3: TComboBox;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1Click(Sender: TObject);
    procedure SGBuild(Sender: TObject);
    procedure init();
    procedure showinfo(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
  public
    function check(sender:TObject;ctype:Integer;einfo:PChar):Boolean;
    { Public declarations }
  end;

var
  Form4: TForm4;
  chked,unchked:TBitmap;
  cuCol,cuRow:Integer;

implementation

uses damo, product_MIDetail;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
  strsql,strwhere:AnsiString;
  savetag:Integer;
begin
   savetag:=Button1.Tag;
   with DM.aqy0610 do
   begin
     close;
     SQL.Clear;
     strsql:='SELECT DISTINCT COUNT(NAME) AS c '+
             'FROM         DATA0610 ';
     strwhere:='WHERE (NAME=''' + Edit1.Text+''')';
     strsql:=strsql+strwhere;
     //OutputDebugString(PChar(strsql));
     sql.Add(strsql);
     open;

     if StringGrid2.Cells[1,cuRow]<>Edit1.Text then
         if Fields[0].AsInteger <> 0 then
           Button1.Tag:=Button1.Tag+10;
     //OutputDebugString(PChar('Button1.Tag:='+IntToStr(Button1.Tag)+';Fields.value:='+fields[0].AsString));
   end;






        if Edit1.Text='' then
         begin
            MessageDlg('必须填写钻孔代称',  mtConfirmation, [mbOK], 0);
            Exit;
         end;
         if Edit3.Text='' then
         begin
            MessageDlg('必须填写钻咀直径',  mtConfirmation, [mbOK], 0);
            Exit;
         end;
         if check(Edit2,1,PChar('必须正确输入成品孔径')) then Exit;
         if check(Edit3,1,PChar('必须正确输入钻咀直径')) then Exit;
         if check(Edit5,0,PChar('请输入正确的单片孔数')) then Exit;
         if check(Edit6,0,PChar('请输入正确的连片孔数')) then Exit;
         if check(Edit7,0,PChar('请输入正确的A板孔数')) then Exit;
         if check(Edit8,0,PChar('请输入正确的B板孔数')) then Exit;
         if Edit10.Text='' then Edit10.Text:='0';
         if ComboBox3.ItemIndex=0 then ComboBox3.ItemIndex:=3;

     case Button1.Tag of
     3:begin
         strwhere:=Button1.Hint;
         strsql:='INSERT INTO DATA0610 '+
            '(NAME, CHECKED, DRLORDER, FINSIZE, ISPLANTED, TOL, DRLSIZE, PCSCNT, SETCNT, PNLACNT, PNLBCNT, '+
            'MEMO, TEMPLATE, TYPE) '+
            'VALUES     ('+
            Format('%0:s%s%0:s, ', ['''', Edit1.Text])+
            Format('%s, ',[BoolToStr(CheckBox1.Checked)])+
            Format('%0:s%s%0:s, ', ['''', Edit10.Text])+
            Format('%0:s%s%0:s, ', ['''', Edit2.Text])+
            Format('%0:s%s%0:s, ', ['''', ComboBox3.Text])+
            Format('%0:s%s%0:s, ', ['''', Edit4.Text])+
            Format('%0:s%s%0:s, ', ['''', Edit3.Text])+
            Format('%0:s%s%0:s, ', ['''', Edit5.Text])+
            Format('%0:s%s%0:s, ', ['''', Edit6.Text])+
            Format('%0:s%s%0:s, ', ['''', Edit7.Text])+
            Format('%0:s%s%0:s, ', ['''', Edit8.Text])+
            Format('%0:s%s%0:s, ', ['''', Edit9.Text])+
            Format('%0:s%s%0:s, ', ['''', ComboBox1.Text])+
            Format('%0:s%s%0:s)', ['''', IntToStr(ComboBox2.ItemIndex)])+ strwhere;
            //OutputDebugString(PChar('|'+strsql+'|'));
            //              (NAME, CHECKED, ISFIXTN, ISFIXTNDEEP, DRLORDER, ISFILLCHAR, FINSIZE, ISPLANTED, TOL, DRLSIZE, PCSCNT, SETCNT, PNLACNT, PNLBCNT,
            //
    //'预钻孔', 0, 0, 0, 20, 0, '2.00', 'N', '+/-0.05', '2.00', '/', '/', '/', '/', '预钻孔', 1)

            with DM.aqy0610 do
            begin
            Close;
            SQL.Clear;
            SQL.Add(strsql);
            ExecSQL;
            end;
     end;
     2: begin

           strwhere:=Button1.Hint;
           strsql:='UPDATE    DATA0610 '+
                   'SET  NAME='+Format('%0:s%s%0:s, ', ['''', Edit1.Text])+
                   'CHECKED='+Format('%s, ',[BoolToStr(CheckBox1.Checked)])+
                   'DRLORDER='+Format('%0:s%s%0:s, ', ['''', Edit10.Text])+
                   'FINSIZE='+Format('%0:s%s%0:s, ', ['''', Edit2.Text])+
                   'ISPLANTED='+Format('%0:s%s%0:s, ', ['''', ComboBox3.Text])+
                   'TOL='+Format('%0:s%s%0:s, ', ['''', Edit4.Text])+
                   'DRLSIZE='+Format('%0:s%s%0:s, ', ['''', Edit3.Text])+
                   'PCSCNT='+Format('%0:s%s%0:s, ', ['''', Edit5.Text])+
                   'SETCNT='+Format('%0:s%s%0:s, ', ['''', Edit6.Text])+
                   'PNLACNT='+Format('%0:s%s%0:s, ', ['''', Edit7.Text])+
                   'PNLBCNT='+Format('%0:s%s%0:s, ', ['''', Edit8.Text])+
                   'MEMO='+Format('%0:s%s%0:s, ', ['''', Edit9.Text])+
                   'TEMPLATE='+Format('%0:s%s%0:s, ', ['''', ComboBox1.Text])+
                   'TYPE='+Format('%0:s%s%0:s ', ['''', IntToStr(ComboBox2.ItemIndex)])+ strwhere;
              //OutputDebugString(PChar('|'+strsql+'|'));
              

              with DM.aqy0610 do
              begin
              Close;
              SQL.Clear;
              SQL.Add(strsql);
              ExecSQL;
              end;


        end;



     1: begin

        end;


     //错误   TAG>10
     13,12:begin
        MessageDlg('名字为 '+EDIT1.Text+' 的孔已经存在 请更换一个',  mtConfirmation, [mbOK], 0);
        Edit1.SetFocus;
        Edit1.SelectAll;
        Button1.Tag:=savetag;
        Exit;

        end;







     end;

     PMEDIT.Visible:=False;
     SGBuild(PopupMenu1.Items[3].Items[0]);
end;

procedure TForm4.N2Click(Sender: TObject);
var
  strsql,strwhere:AnsiString;
begin
     PMEDIT.Visible:=True;
     Button1.Tag:=2;
     strsql:='SELECT * '+
             'FROM         dbo.DATA0610 ';
     strwhere:='WHERE     (NAME = '''+StringGrid2.Cells[1,cuRow]+''')';
     Button1.Hint:=strwhere;
     strsql:=strsql+strwhere;
     //OutputDebugString(PChar(strsql));
     with DM.aqy0610 do
     begin
       close;
       SQL.Clear;
       sql.Add(strsql);
       Open;
          //OutputDebugString(PChar(IntToStr(Fields.Count)+'|'+Fields[1].AsString+'|'+Fields[0].AsString));
          Edit1.Text:=         Fields[1].AsString;
          CheckBox1.Checked:=  Fields[2].AsBoolean;
          Edit10.Text:=        Fields[3].AsString;
          Edit2.Text:=         Fields[4].AsString;
          ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(Fields[5].AsString);
          Edit4.Text:=         Fields[6].AsString;
          Edit3.Text:=         Fields[7].AsString;
          Edit5.Text:=         Fields[8].AsString;
          Edit6.Text:=         Fields[9].AsString;
          Edit7.Text:=         Fields[10].AsString;
          Edit8.Text:=         Fields[11].AsString;
          Edit9.Text:=         Fields[12].AsString;
          ComboBox1.Text:=     Fields[13].AsString;
          ComboBox2.ItemIndex:=Fields[14].AsInteger;

     end;
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  bmp:TBitmap;
begin
   StringGrid2.Rows[0].DelimitedText:='激活,钻孔名称,成品孔径,PTH,公差,钻咀,PCS孔数,SET孔数,A板孔数,B板孔数,备注';
   chked:=TBitmap.Create;
   unchked:=TBitmap.Create;
   bmp:=TBitmap.Create;
   try
     bmp.Handle:=LoadBitmap(0,Pchar(OBM_CHECKBOXES));
     with unchked do
     begin
       width:=13;
       height:=13;
       Canvas.CopyRect(canvas.cliprect,bmp.Canvas,Rect(0,0,13,13));
     end;
     with chked do
     begin
       width:=13;
       height:=13;
       Canvas.CopyRect(canvas.cliprect,bmp.Canvas,Rect(13,0,26,13));
     end;
     finally
     DeleteObject(bmp.Handle);
     bmp.Free;
   end;
      SGBuild(N5);
      init;
end;



procedure TForm4.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  dps:TGraphic;
begin
if Acol=0 then
begin
   if not(gdFixed in State) then
     with Tstringgrid(Sender).Canvas do
     begin
       brush.Color:=clWindow;
       FillRect(Rect);
       if LowerCase(Tstringgrid(Sender).Cells[ACol,ARow])='true' then
          dps:=chked
          else
          dps:=unchked;
       Draw((Rect.Right+Rect.Left-dps.Width) div 2,(Rect.Bottom+Rect.Top-dps.Height) div 2,dps);
     end;
end;
end;

procedure TForm4.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  i:Integer;
begin
  cuRow:=ARow;
  cuCol:=ACol;
  //OutputDebugString(PChar('CurrentGroup row:'+IntToStr(cuRow)+';col:'+IntToStr(cuCol)+',value:'+StringGrid2.Cells[ACol,ARow]+';param:CanSelect='+BoolToStr(CanSelect,True)));
  if ACol=0 then
  case N7.Checked of
  False:  if LowerCase(Tstringgrid(Sender).Cells[0,ARow])='true' then
            Tstringgrid(Sender).Cells[0,ARow]:='false'
          else
            Tstringgrid(Sender).Cells[0,ARow]:='true';
  True:  begin
            for i:=1 to StringGrid2.RowCount-1 do
              Tstringgrid(Sender).Cells[0,i]:='False';
            Tstringgrid(Sender).Cells[0,ARow]:='true';
         end;
  end;
  case ACol of
  0,1,2,11:StringGrid2.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect];
  else
  StringGrid2.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goEditing];
  end;

end;

procedure TForm4.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  mp:Integer;
begin
  if Button=mbRight then
  begin
    mp:=StrToInt(Format('$%.4x%.4x',[Y,X]));
    SendMessage(StringGrid2.Handle,WM_LBUTTONDOWN,0,mp);
    SendMessage(StringGrid2.Handle,WM_LBUTTONUP,0,mp);
  end;
end;

procedure TForm4.SGBuild(Sender: TObject);
var
    i,j:integer;
    strsql,strwhere:AnsiString;
begin
  if TMenuItem(Sender).Caption='显示全部' then
   strwhere:='where 1=1 '
   else
   strwhere:=' where TEMPLATE in (''全局显示'','+''''+TMenuItem(Sender).Caption+''') ';
  if n7.Checked then
  strwhere:=strwhere+'and (type=1) '
  else
  strwhere:=strwhere+'and (type<>1) ';



   with DM.aqy0610 do
   begin
     close;
     sql.Clear;
     strsql:='SELECT     CHECKED, NAME, FINSIZE, ISPLANTED, TOL, DRLSIZE, PCSCNT, SETCNT, PNLACNT, PNLBCNT, MEMO,rkey ,TYPE, DRLORDER '+
             'FROM         dbo.DATA0610 ';
     strsql:=strsql+strwhere+' ORDER BY TYPE, DRLORDER';
     //OutputDebugString(PChar(strsql));
     sql.Add(strsql);
     Open;
     StringGrid2.RowCount:=RecordCount+1;
     StringGrid2.Update;
     i:=1;
     while not eof do
     begin
       for j:=0 to StringGrid2.ColCount-1 do
       begin
         if j=0 then
            StringGrid2.Cells[j,i]:=BoolToStr(Fields[j].AsBoolean,True)
            else
            StringGrid2.Cells[j,i]:=Fields[j].AsString;
         //OutputDebugString(PChar('cell['+inttostr(i)+','+inttostr(j)+']的值：'+fields[j].AsString));
       end;
       i:=i+1;
       next;
     end;
   end;
end;

procedure TForm4.init;
var
    j:integer;
    strsql,strwhere:AnsiString;
    varmenu:TMenuItem;
begin
   strwhere:=' ';


     PopupMenu1.Items[3].Clear;
     //PopupMenu1.Items[3].Add(varmenu);
     ComboBox1.Items.Clear;

       varmenu:=TMenuItem.Create(PopupMenu1.Items[3]);
       varmenu.Caption:='显示全部';
       varmenu.Enabled:=True;
       varmenu.Visible:=True;
       varmenu.OnClick:=SGBuild;
       varmenu.Name:='N5';
       PopupMenu1.Items[3].Add(varmenu);

     ComboBox1.Items.Add('新模板..');
     ComboBox1.Items.Add('全局显示');
     ComboBox1.ItemIndex:=1;



   with DM.aqy0610 do
   begin
     close;
     SQL.Clear;
     strsql:='SELECT DISTINCT TEMPLATE '+
             'FROM         dbo.DATA0610 ';
     strwhere:='WHERE     (TEMPLATE <> ''全局显示'')';
     strsql:=strsql+strwhere;
     //OutputDebugString(PChar(strsql));
     sql.Add(strsql);
     open;
     j:=0;
     while not Eof do
     begin
       //OutputDebugString(PChar(Fields[0].AsString+' - '+IntToStr(j+1)+'/'+IntToStr(RecordCount)));
       //try
       varmenu:=TMenuItem.Create(PopupMenu1.Items[3]);
       varmenu.Caption:=Fields[0].AsString;
       ComboBox1.Items.Add(Fields[0].AsString);
       varmenu.Enabled:=True;
       varmenu.Visible:=True;
       varmenu.OnClick:=SGBuild;
       varmenu.Name:='VN'+IntToStr(j);
       //OutputDebugString(PChar('即将增加的菜单名：'+varmenu.Caption+'   菜单类名：'+varmenu.Name));
       PopupMenu1.Items[3].Add(varmenu);
       //finally
         //varmenu.Free;
       //end;
       j:=j+1;
       Next;
     end;
   end;
   {
   with DM.aqy0610 do
   begin
     close;
     open;
     StringGrid2.RowCount:=recordcount+1;
     StringGrid2.Update;
     i:=1;
     while not eof do
     begin
       for j:=0 to StringGrid2.ColCount-1 do
       begin
         if j=0 then
            StringGrid2.Cells[j,i]:=BoolToStr(Fields[j].AsBoolean,True)
            else
            StringGrid2.Cells[j,i]:=Fields[j].AsString;
         //OutputDebugString(PChar('cell['+inttostr(i)+','+inttostr(j)+']的值：'+fields[j].AsString));
       end;
       i:=i+1;
       next;
     end;
   end;
   }
    ComboBox1.ItemIndex:=1;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
     case StrToInt(vprev) of
     4: begin
            N1.Visible:=True;
            N2.Visible:=True;
            N3.Visible:=True;
        end;
        else
        begin
            N1.Visible:=False;
            N2.Visible:=False;
            N3.Visible:=False;
        end;
     end;

end;

procedure TForm4.N3Click(Sender: TObject);
begin
     PMEDIT.Visible:=True;
     Edit1.Text:='';
     Edit2.Text:='';
     Edit3.Text:='';
     Edit4.Text:='';
     Edit5.Text:='';
     Edit6.Text:='';
     Edit7.Text:='';
     Edit8.Text:='';
     Edit9.Text:='';
     CheckBox1.Checked:=False;
     ComboBox1.ItemIndex:=1;
     ComboBox2.ItemIndex:=0;
     Button1.Tag:=3;
     Button1.Hint:='';
end;





procedure TForm4.Edit1Click(Sender: TObject);
begin
    Memo1.Text:='*必填,表示此钻孔的代称.如定位孔';
end;



procedure TForm4.showinfo(Sender: TObject);
begin
     if Sender=Edit1 then
     Memo1.Text:='*必填,表示此钻孔的代称.如定位孔';
     if Sender=Edit2 then
     Memo1.Text:='不填默认为"/"';
     if Sender=Edit3 then
     Memo1.Text:='*必填,钻孔用的钻咀直径';
     if Sender=Edit4 then
     Memo1.Text:='公差,如+/-0.05,不填为"/"';
     if Sender=Edit5 then
     Memo1.Text:='不填默认为"/"';
     if Sender=Edit6 then
     Memo1.Text:='不填默认为"/"';
     if Sender=Edit7 then
     Memo1.Text:='不填默认为"/"';
     if Sender=Edit8 then
     Memo1.Text:='不填默认为"/"';
     if Sender=Edit9 then
     Memo1.Text:='不填默认为"/"';
     if Sender=Edit10 then
     Memo1.Text:='此序号表示同一模板同一位置的钻孔按此从小大到排列显示';
     if Sender=CheckBox1 then
     Memo1.Text:='此孔是否默认是选中即默认是要添加的孔';
     if Sender=ComboBox1 then
     begin
       Memo1.Text:='模板归类,方便筛选';
     end;
     if Sender=ComboBox2 then
     begin
       Memo1.Text:='钻孔所加位置';
     end;
     if Sender=ComboBox3 then
     begin
       Memo1.Text:='钻孔属性,即是否电镀或表示无要求的"/"';
     end;






end;


procedure TForm4.ComboBox1Click(Sender: TObject);
begin
   if ComboBox1.Text='新模板..' then
   begin
     ComboBox1.ItemIndex:=ComboBox1.Items.Add(InputBox('新模板名字','请输入新的模板名字','未分类'));
   end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
     PMEDIT.Visible:=False;
     Edit1.Text:='';
     Edit2.Text:='';
     Edit3.Text:='';
     Edit4.Text:='';
     Edit5.Text:='';
     Edit6.Text:='';
     Edit7.Text:='';
     Edit8.Text:='';
     Edit9.Text:='';
     CheckBox1.Checked:=False;
     ComboBox1.ItemIndex:=0;
     ComboBox2.ItemIndex:=0;
     ComboBox3.ItemIndex:=0;
     Button1.Tag:=0;
end;

procedure TForm4.Edit1Change(Sender: TObject);
var
    strsql,strwhere,sqlbackup:AnsiString;
    savetag:Integer;
begin
   savetag:=Button1.Tag;

   if Edit1.Focused then
   with DM.aqy0610 do
   begin
     sqlbackup:=SQL.Text;
     close;
     SQL.Clear;
     strsql:='SELECT DISTINCT COUNT(NAME) AS c '+
             'FROM         DATA0610 ';
     strwhere:='WHERE (NAME=''' + Edit1.Text+''')';
     strsql:=strsql+strwhere;
     //OutputDebugString(PChar(strsql));
     sql.Add(strsql);
     open;

     if StringGrid2.Cells[1,cuRow]=Edit1.Text then
        Button1.Tag:=savetag
        else
         if Fields[0].AsInteger = 0 then
           Button1.Tag:=savetag
         else
           Button1.Tag:=savetag+10;
     //OutputDebugString(PChar('Button1.Tag:='+IntToStr(Button1.Tag)+';Fields.value:='+fields[0].AsString));
   end;







end;

procedure TForm4.N1Click(Sender: TObject);
var
    strsql,strwhere:AnsiString;
    cnt:Integer;
begin
   with DM.aqy0610 do
   begin
     close;
     SQL.Clear;
     strsql:='SELECT     COUNT(RKEY) AS c '+
             'FROM         DATA0610 ';
     strwhere:='';
     strsql:=strsql+strwhere;
     //OutputDebugString(PChar(strsql));
     SQL.Add(strsql);
     Open;
     cnt:=Fields[0].AsInteger;
   end;

   if cnt=1 then
   begin
      MessageDlg('最后一条记录不允许删除，请修改',  mtWarning, [mbOK], 0);
      Exit;
   end
   else
   if MessageDlg('此过程不可逆是否仍然确定要删除',  mtWarning, mbOKCancel,
     0) = mrCancel
     then
     Exit;


   with DM.aqy0610 do
   begin
     close;
     SQL.Clear;
     strsql:='DELETE '+
             'FROM         DATA0610 ';
     strwhere:='WHERE (NAME=''' + StringGrid2.Cells[1,cuRow]+''')';
     strsql:=strsql+strwhere;
     //OutputDebugString(PChar(strsql));
     SQL.Add(strsql);
     ExecSQL;
   end;

   SGBuild(PopupMenu1.Items[3].Items[0]);


   //  DELETE FROM DATA0610
//WHERE     (NAME = 'aa')

end;



function TForm4.check(sender: TObject; ctype: Integer;
  einfo: PChar): Boolean;
var
  strtmp:string;
  inttmp:Integer;
  exttmp:Extended;
begin
     strtmp:=TEdit(sender).Text;
     Result:=False;
     if (strtmp='') or (strtmp = '/') then
        TEdit(sender).Text:='/'
     else
     begin
         case ctype of
           0: Result:=not TryStrToInt(strtmp,inttmp);
           1: Result:=not TryStrToFloat(strtmp,exttmp);
         else
           Result:=True;
         end;
         if Result then
         begin
           MessageDlg(StrPas(einfo),  mtConfirmation, [mbOK], 0);
           TEdit(sender).SetFocus;
         end;
     end;

end;


procedure TForm4.N6Click(Sender: TObject);
var
  rowtmp,innum,i,j,exchval,origval:Integer;
  rowdata:TStrings;
//  extchk,extchk1:Extended;
//  extstr:string;
begin
{CHECKED, NAME, FINSIZE, ISPLANTED, TOL, DRLSIZE, PCSCNT, SETCNT, PNLACNT, PNLBCNT, MEMO,rkey ,TYPE, DRLORDER,ISFIXTN ,ISFILLCHAR}
{   0       1     2          3        4      5      6       7         8       9       10  11     12      13      14       15  }
{==上是本窗体SQL查询出的StringGrid1的COL==下是钻咀表的rowdata的COL =====================}
{ 0   1   2     3       4   5     6    7        8       9      10      11 }
{序,刀具,符号,成品孔径,PTH,公差,钻咀,PCS孔数,SET孔数,A板孔数,B板孔数,备注}
    rowdata:=TStringList.Create;
    innum:=1;
    for rowtmp:=1 to StringGrid2.RowCount-1 do
    if LowerCase(StringGrid2.Cells[0,rowtmp])='true' then
      begin
          rowdata.Clear;
          rowdata.Add('09');
          rowdata.Add(' ');
          rowdata.Add('/');
          rowdata.Add(StringGrid2.Cells[2,rowtmp]);
          rowdata.Add(StringGrid2.Cells[3,rowtmp]);
          rowdata.Add(StringGrid2.Cells[4,rowtmp]);
          rowdata.Add(StringGrid2.Cells[5,rowtmp]);
          rowdata.Add(StringGrid2.Cells[6,rowtmp]);
          rowdata.Add(StringGrid2.Cells[7,rowtmp]);
          rowdata.Add(StringGrid2.Cells[8,rowtmp]);
          rowdata.Add(StringGrid2.Cells[9,rowtmp]);
          rowdata.Add(StringGrid2.Cells[10,rowtmp]);

      //OutputDebugString(PChar(LowerCase('/'+StringGrid2.Cells[0,rowtmp]+'/')));
        case StrToInt(StringGrid2.Cells[12,rowtmp]) of
         0:with Form2.StringGrid1 do
              begin
                RowCount:=RowCount+1;
                for i:=RowCount-1 downto innum do
                Rows[i].Assign(Rows[i-1]);
                Rows[innum].Assign(rowdata);
                innum:=innum+1;
              end;
         1:with Form2.StringGrid1 do
           begin
              if TryStrToInt(Self.Caption,i) then
              begin
                 if Trim(Cells[3,i])<>'' then
                 begin
                    for j:=6 to 10 do
                     if TryStrToInt(rowdata.Strings[j],exchval) then
                        begin
                           case TryStrToInt(Cells[j,i],origval) of
                             True: Cells[j,i]:=IntToStr(origval+exchval);
                             False: Cells[j,i]:=IntToStr(exchval);
                           end;
                        end;
                 end
                 else
                 Rows[i].Assign(rowdata);
              end;
           end;



         2:with Form2.StringGrid1 do
           begin
               RowCount:=RowCount+1;
               for i:=RowCount-1 downto 0 do
               if Cells[0,i]<>'' then
               begin
                 Rows[i+1].Assign(rowdata);
                 Break;
               end;

           end;

        end;

      end;
      with Form2.StringGrid1 do
      begin
      for i:=1 to RowCount-1 do
         if Cells[2,i]<>'' then
         begin
           Cells[0,i]:=IntToStr(i);
           Cells[1,i]:='T'+IntToStr(i);
         end;

      Update;
      end;
   Form4.Close;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
    cuCol:=0;
    cuRow:=1;
end;

procedure TForm4.N7Click(Sender: TObject);
var
  i:Integer;
begin
    N7.Default:=not N7.Checked;
    N7.Checked:=not N7.Checked;
    SGBuild(PopupMenu1.Items[3].Items[0]);
    if N7.Checked then
        for i:=StringGrid2.RowCount-1 downto 1 do
           StringGrid2.Cells[0,i]:='false';
        StringGrid2.Update;


end;

end.
