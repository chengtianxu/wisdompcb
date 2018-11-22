unit pack_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Grids, DBGrids, Buttons, DB, ADODB,
  ExtCtrls, DBGridEh;

type
  TForm4 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    Bar1: TStatusBar;
    N8: TMenuItem;
    N12: TMenuItem;
    N19: TMenuItem;
    PrintDialog1: TPrintDialog;
    N27: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    Grd1: TDBGridEh;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure mul_print(rkey439:integer);
    procedure N6Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DblClick(Sender: TObject);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtQryClick(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
  public
    { Public declarations }

   empl_ptr:integer;        //员工指针
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
  end;

var
  Form4: TForm4;

implementation
uses damo, add_packlist, list_report, packlist_report,
   mul_report,common, Frm_QrySet_u;
{$R *.dfm}



procedure TForm4.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
  self.Caption:=application.Title;

//  user_ptr:='4';
//  rkey73:='4';
//  vprev:='4';
//  dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := Grd1.WindowProc;
  Grd1.WindowProc := NewGridWnd;
end;

procedure TForm4.FormShow(Sender: TObject);
 var da:TDateTime;
begin
  dm.ADO192.Open;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select employee_ptr from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    empl_ptr:=fieldvalues['employee_ptr'];
    user_ptr:=IntToStr(empl_ptr);
  end;
  da:=getsystem_date(dm.ADOQuery1,1);
  PreColumn:=Grd1.Columns[0];
  field_name:='delivery_no';
  sSql := dm.ADO0439.SQL.Text;
  dm.ADO0439.SQL.Text := dm.ADO0439.SQL.Text+

  ' where (data0439.date_sailing >='+quotedstr(formatdatetime('YYYY-MM-DD',da))+')'+
  ' and (data0439.date_sailing <='+quotedstr(formatdatetime('YYYY-MM-DD',da))+')'+
  ' ';

  dm.ADO0439.Prepared;

  dm.ADO0439.Open;
  dm.ado0439.Sort:=PreColumn.FieldName;

end;

procedure tform4.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    Grd1.DataSource.DataSet.MoveBy(1)
   else
    Grd1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;


procedure TForm4.N1Click(Sender: TObject);
var
 rkey439:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
  else
  if dm.ADO192.IsEmpty then
    messagedlg('请首先用文件菜单定义默认单位!',mtinformation,[mbok],0)
  else
  try
    form5:=tform5.Create(application);
    rkey439:=dm.ADO0439rkey.Value;
    dm.ADO0439.Filtered := false;
    dm.ADO0439.Append;
    dm.ADO0439weight.Value:=0;            //毛重
    dm.ADO0439net_weight.Value:=0;        //净重
    dm.ADO0439cartons_no.Value:=0;        //箱数
    dm.ADO0439charge.Value:=0;            //装运费用
    dm.ado0439unit_ptr.value := dm.ADO192unit_ptr.Value;
    form5.edit3.Text:=dm.ADO192unit_code.Value;
    form5.Label8.Caption := dm.ADO192unit_name.Value;
    dm.ADO04.Close;
    dm.ADO04.Open;
    if dm.ADO04SEED_FLAG.Value<>1 then
     dm.ADO0439delivery_no.Value:=dm.ADO04.FieldValues['seed_value']; //计算机自动同SO一样
    if dm.ADO04seed_flag.Value=4 then
      Form5.DBEdit1.ReadOnly:=True;
    form5.MaskEdit1.Text:=datetostr(getsystem_date(dm.ADOQuery1,1)); //短格式
    dm.ADO0439employee_ptr.Value:=empl_ptr; //建立员工
    form5.CheckBox1.Visible:=true;
    form5.ShowModal;
   dm.ADO0439.Filtered := true;
{    dm.ADO0439.Close;
    dm.ADO0439.Open;}
    if Form5.v_post=true then       //成功新增过记录
     BtBrushClick(sender)
    else
     dm.ADO0439.Locate('rkey',rkey439,[]);

  finally
    form5.free;
  end;

end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
 if not dm.ADO0439.IsEmpty then
  begin
   if dm.ADO0439invoice_ptr.AsVariant<>null then
    begin
     n2.Enabled:=false;
     n19.Enabled:=false;
    end
   else
    begin
     n2.Enabled:=true;
     n19.Enabled:=true;
    end;
   n4.Enabled := true;
   n6.Enabled := true;


   n12.Enabled := true;
   n27.Enabled := true;
  end
 else
  begin

   n2.Enabled := false;
   n4.Enabled := false;
   n6.Enabled := false;
   n12.Enabled := false;
   n19.Enabled := false;
   n27.Enabled := false;
  end;
end;

procedure TForm4.N2Click(Sender: TObject);
//var
// rkey439:integer;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0);
  exit;
 end;

if dm.ADO0439invoice_ptr.AsVariant = null then
try
 form5:=tform5.Create(application);

 with form5 do
  begin
   edit1.Enabled:=false;
   bitbtn4.Enabled:=false;
   bitbtn5.Enabled:=false;
  end;

  DM.qrytmp.Close;
  DM.qrytmp.SQL.Clear;
  DM.qrytmp.SQL.Add('select * from data0439 where rkey = ' + DM.ADO0439.fieldbyname('rkey').AsString);
  DM.qrytmp.Open;
  DM.dspcmp.DataSet := DM.qrytmp;
  DM.cds439cmpold.Data := DM.dspcmp.Data;

  DM.qrytmp.Close;
  DM.qrytmp.SQL.Clear;
  DM.qrytmp.SQL.Add('select rkey from data0064 where packing_list_ptr = ' + DM.ADO0439.fieldbyname('rkey').AsString);
  dm.qrytmp.Open;
  DM.dspcmp.DataSet := DM.qrytmp;
  DM.cds64cmpold.Data := DM.dspcmp.Data;

  dm.ADO0439.Edit;



 if form5.ShowModal=mrok then
  begin
//   rkey439 := dm.ADO0439rkey.Value;
//   dm.ADO0439.Close;
//   dm.ADO0439.Open;
//   dm.ADO0439.Locate('rkey',rkey439,[]);
//   dm.ADOTa64.Close;
 //  dm.ADOTa64.Open;
  end;

finally
 form5.Free;
end;
end;

procedure TForm4.N4Click(Sender: TObject);
begin
try
 form5:=tform5.Create(application);
 with form5 do
  begin
   edit1.Enabled:=false;
   bitbtn1.enabled:=false;
   bitbtn4.Enabled:=false;
   bitbtn5.Enabled:=false;
   bitbtn6.Enabled:=false;
   bitbtn7.Enabled:=false;
   bitbtn8.Enabled:=false;

   dbedit1.Enabled:=false;
   dbedit2.Enabled:=false;
   dbedit3.Enabled:=false;
   dbedit4.Enabled:=false;
   dbedit5.Enabled:=false;
   dbedit6.Enabled:=false;
   dbedit7.Enabled:=false;
   dbedit8.Enabled:=false;
   dbedit9.Enabled:=false;
   dbedit10.Enabled:=false;
   dbedit11.Enabled:=false;
   dbedit12.Enabled:=false;
   maskedit1.Enabled:=false;
   if dm.ADO0439invoice_ptr.AsVariant<>null then
    begin
     with dm.ADOQuery1 do
      begin
       close;
       sql.Clear;
       sql.Add('select invoice_number from data0112');
       sql.Add('where rkey='+dm.ADO0439invoice_ptr.AsString);
       open;
      end;
     label18.Visible:=true;
     edit5.Visible:=true;
     edit5.Text:=dm.ADOQuery1.FieldValues['invoice_number'];
     dm.ADOQuery1.Close;
    end;
  end;
 form5.ShowModal;
finally
 form5.Free;
end;

end;

procedure TForm4.N8Click(Sender: TObject);
begin
 dm.ADO0439.Close;
 dm.ADO0439.Open;
end;



procedure TForm4.N12Click(Sender: TObject);
var
 pack_no :string;
begin
  form9:=tform9.Create(application);
  if pos('-',dm.ADO0439delivery_no.Value)<>0 then
    pack_no:=copy(dm.ADO0439delivery_no.Value,1,pos('-',dm.ADO0439delivery_no.Value)-1)
  else
    pack_no:=dm.ADO0439delivery_no.Value;
    form9.ADOQuery1.Close;
    form9.ADOQuery1.Parameters[0].Value:=pack_no+'%';
    form9.ADOQuery1.Open;
    form9.ppReport1.Print;
    form9.Free;
end;

procedure TForm4.N19Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
if messagedlg('您确定要删除该条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin
  with DM.ADOQuery1 do
  begin
   Close;
   sql.Clear;
   sql.Add('select data0064.* from data0064 inner join data0439');
   SQL.Add('on data0439.rkey=data0064.packing_list_ptr');
   sql.Add('where data0064.rkey529_ptr>0');
   SQL.Add('and data0439.rkey='+dm.ADO0439rkey.AsString);
   Open;
  end;
  if dm.ADOQuery1.IsEmpty=False then
  begin
    MessageDlg('此装箱单已有报关记录,不能删除!',mtInformation,[mbOK],1);
    Exit;
  end;
  with DM.ADOQuery1 do
  begin
   Close;
   sql.Clear;
   sql.Add('select data0064.* from data0064 inner join data0439');
   SQL.Add('on data0439.rkey=data0064.packing_list_ptr');
   sql.Add('where data0064.recon_qty>0');
   SQL.Add('and data0439.rkey='+dm.ADO0439rkey.AsString);
   Open;
  end;
  if dm.ADOQuery1.IsEmpty=False then
  begin
    MessageDlg('此装箱单已有对帐记录,不能删除,请联系财务人员!',mtInformation,[mbOK],1);
    Exit;
  end;
  dm.ADOConnection1.BeginTrans;
  try
   with dm.Aq43911 do
   begin
    close;
    Parameters[2].Value:=dm.ADO0439rkey.Value;
    open;
    if not isempty then delete;
   end;

   with dm.ADOQuery1 do
    begin
    close;
    sql.Text:=
    'delete data0153'+#13+
    'FROM  dbo.DATA0153 INNER JOIN'+#13+
    'dbo.Data0064 ON dbo.DATA0153.SHIP_PTR = dbo.Data0064.RKEY'+#13+
    'where Data0064.packing_list_ptr='+dm.ADO0439rkey.AsString;
    ExecSQL;
    end;

   with dm.ADOQuery4 do     //查找指派
    begin
     close;
     Parameters[1].Value:=dm.ADO0439rkey.Value;
     open;
     while not eof do
      begin
       edit;
       fieldvalues['packing_list_ptr']:=null;
       fieldvalues['packing_slip_flag']:='0';
       Fieldvalues['date_shipped']:=null;
       post;
       next;
      end
    end;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('delete from data0439');
     sql.Add('where rkey='+dm.ADO0439rkey.AsString);
     ExecSQL;
    end;
   dm.ADOConnection1.CommitTrans;
   BtBrushClick(sender);
   showmessage('数据成功删除!!!');
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据不成功,请速与管理员联系!!!');
  end;
 end;
end;

procedure TForm4.mul_print(rkey439:integer);
begin
  try
    form6:=tform6.Create(application);
    form6.aq0439.Close;
    form6.aq0439.Parameters[0].Value:=rkey439;
    form6.aq0439.Open;
    case form6.aq0439APPLY_IN_TRANSIT.Value of
      0:
      form6.ppReport1.Template.FileName :=
        stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'packlist_list_Areport.rtm';       //R:\NIERP\Report\packlist_list_Areport.rtm
      1:
      form6.ppReport1.Template.FileName :=
        stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'packlist_list_Areport2.rtm';       //R:\NIERP\Report\packlist_list_Areport2.rtm
      2:
      form6.ppReport1.Template.FileName :=
        stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'packlist_list_Areport3.rtm';      //R:\NIERP\Report\packlist_list_Areport3.rtm
      3:
      form6.ppReport1.Template.FileName :=
        stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
          'packlist_list_Areport4.rtm';             //R:\NIERP\Report\packlist_list_Areport4.rtm
    end;
    form6.ppReport1.Template.LoadFromFile;
    form6.ppReport1.SaveAsTemplate:=false;

    form6.ppReport1.DeviceType:='Printer';
    form6.ppReport1.ShowPrintDialog:=false;
    form6.ppReport1.Print;
    {
    case form6.aq0439APPLY_IN_TRANSIT.Value of
    0:
     begin;
      form6.ppReport1.DeviceType:='Printer';
      form6.ppReport1.ShowPrintDialog:=false;
      form6.ppReport1.Print;
     end;
    1:
     begin;
      form6.ppReport3.DeviceType:='Printer';
      form6.ppReport3.ShowPrintDialog:=false;
      form6.ppReport3.Print;
     end;
    2:
     begin;
      form6.ppReport4.DeviceType:='Printer';
      form6.ppReport4.ShowPrintDialog:=false;
      form6.ppReport4.Print;
     end;
    3:
     begin;
      form6.ppReport5.DeviceType:='Printer';
      form6.ppReport5.ShowPrintDialog:=false;
      form6.ppReport5.Print;
     end;
    end;  }

    if form6.aq0439print_date.AsVariant=null then
     begin
      form6.aq0439.Edit;
      form6.aq0439print_date.Value:=getsystem_date(dm.ADOQuery1,1);
      form6.aq0439.Post;
     end;

  finally
    form6.free;
  end;
end;

procedure TForm4.N27Click(Sender: TObject);
var
 i:integer;
begin
  form_mulreport := tform_mulreport.Create(application);
  if form_mulreport.ShowModal=mrok then
  begin
    for i:=1 to form_mulreport.StG2.RowCount-2 do
      self.mul_print(strtoint(form_mulreport.StG2.Cells[2,i]));
    self.BtBrushClick(sender);
  end;
  form_mulreport.Free;
end;

procedure TForm4.N6Click(Sender: TObject);
//var
//   V_pk,V_defi:currency;
begin
// V_pk:=ExRoundTo(dm.cacl_pkqmout(dm.ADO0439rkey.Value),2);  //本次出货金额
// V_defi:=ExRoundTo(dm.cacl_deficiency(dm.ADO0439customer_ptr.Value),2); //当前客户余额本公司欠客户余额
  if (dm.ADO0439cod_flag.Value = 'Y') and (dm.sql_codflag(dm.ADO0439rkey.Value)) then   //(V_pk - V_defi > 0.1) then

    showmsg('客户为款到发货标识,PO号:'+dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString+
            ':可出货总数:'+dm.ADOQuery1.fieldbyname('qty').AsString+'少于已出货总数:'+
    dm.ADOQuery1.fieldbyname('qtyed').AsString,1)
  else
    try
      form6:=tform6.Create(application);
      form6.aq0439.Close;
      form6.aq0439.Parameters[0].Value:=dm.ADO0439rkey.Value;
      form6.aq0439.Open;

      form6.ppReport1.Reset;
      case dm.ADO0439overship_flag.asinteger of
        0:
        form6.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'packlist_list_Areport.rtm';       //R:\NIERP\Report\packlist_list_Areport.rtm
        1:
        form6.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'packlist_list_Areport2.rtm';       //R:\NIERP\Report\packlist_list_Areport2.rtm
        2:
        form6.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'packlist_list_Areport3.rtm';      //R:\NIERP\Report\packlist_list_Areport3.rtm
        3:
        form6.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'packlist_list_Areport4.rtm';             //R:\NIERP\Report\packlist_list_Areport4.rtm
      end;
      form6.ppReport1.Template.LoadFromFile;
      form6.ppReport1.SaveAsTemplate:=false;

      form6.ppReport1.Print;

      if dm.ADO0439print_date.AsVariant=null then
        if messagedlg('是否将该张作业单标识成已打印?',mtconfirmation,[mbYes,mbNo],0)=mryes then
        begin
          dm.ADO0439.Edit;
          dm.ADO0439print_date.Value:=getsystem_date(dm.ADOQuery1,1);
          dm.ADO0439.Post;
        end;
      self.BtBrushClick(sender);
    finally
      form6.free;
    end;
end;



procedure TForm4.BitBtn6Click(Sender: TObject);
begin

if (dm.ADO0439cod_flag.Value = 'Y') and    //(V_pk - V_defi > 0.1) then
   (dm.sql_codflag(dm.ADO0439rkey.Value)) then
 showmsg('客户为款到发货标识,PO号:'+dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString+
 ':可出货总数:'+dm.ADOQuery1.fieldbyname('qty').AsString+'少于已出货总数:'+
    dm.ADOQuery1.fieldbyname('qtyed').AsString,1)
else
if not dm.ADO0439.IsEmpty then
 try
  form6:=tform6.Create(application);
  form6.aq0439.Close;
  form6.aq0439.Parameters[0].Value:=dm.ADO0439rkey.Value;
  form6.aq0439.Open;
if printdialog1.Execute then
 begin
  form6.ppReport1.Reset;
  case dm.ADO0439APPLY_IN_TRANSIT.Value of
  0:
  form6.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'packlist_list_Areport.rtm';       //R:\NIERP\Report\packlist_list_Areport.rtm
  1:
  form6.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'packlist_list_Areport2.rtm';      //R:\NIERP\Report\packlist_list_Areport2.rtm
  2:
  form6.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'packlist_list_Areport3.rtm';      //R:\NIERP\Report\packlist_list_Areport3.rtm
  3:
  form6.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'packlist_list_Areport4.rtm';      //R:\NIERP\Report\packlist_list_Areport4.rtm
  end;
  form6.ppReport1.Template.LoadFromFile;
  form6.ppReport1.SaveAsTemplate:=false;
  form6.ppReport1.DeviceType:='Printer';
  form6.ppReport1.ShowPrintDialog:=false;
  form6.ppReport1.Print;

  dm.ADO0439.Edit;
  dm.ADO0439print_date.Value:=getsystem_date(dm.ADOQuery1,1);
  dm.ADO0439.Post;
  self.BtBrushClick(sender);
 end;
 finally
  form6.free;
 end;
end;

procedure TForm4.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
  application.Terminate;
end;

procedure TForm4.Grd1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
   begin
    column.Title.SortMarker:=smUpEh;
    dm.ado0439.Sort:=Column.FieldName;
   end
  else
   begin
    column.Title.SortMarker:=smDownEh;
    dm.ado0439.Sort:=Column.FieldName+' DESC';
   end;

  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName <> column.FieldName) then
   begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
   end
  else
   edit1.SetFocus;
end;

procedure TForm4.Grd1DblClick(Sender: TObject);
begin
 if not dm.ADO0439.IsEmpty then n2click(sender);
end;

procedure TForm4.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if dm.ADO0439invoice_ptr.AsVariant<>null then
  Grd1.Canvas.Font.Color := clBlue
 else
  if dm.ADO0439print_date.AsVariant<> null then
  Grd1.Canvas.Font.Color := clred;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
     begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else
       if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
     end
    else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TForm4.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then showmessage(dm.ADO0439.SQL.Text);
end;

procedure TForm4.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr,adosort:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
     if Frm_QrySet.sgrid1.Cells[2,i]<> '' then
      Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];

    adosort:=DM.ADO0439.Sort;
    DM.ADO0439.Close;
    DM.ADO0439.SQL.Text:=sSql+' where data0439.date_sailing>='''+formatdatetime('YYYY-MM-DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0439.date_sailing-1<='''+formatdatetime('YYYY-MM-DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+
                           ' ';
    dm.ADO0439.Prepared;
    DM.ADO0439.Open;
    DM.ADO0439.Sort:=adosort;
  end;
end;

procedure TForm4.BtBrushClick(Sender: TObject);
var
  i:integer;
  adosort:string;
begin
  if not DM.ADO0439.IsEmpty then
    i := DM.ADO0439rkey.AsInteger
  else
    i:=0;
  adosort:=DM.ADO0439.Sort;
  DM.ADO0439.Close;
  DM.ADO0439.Open;

  DM.ADO0439.Sort:=adosort;
  DM.ADO0439.Locate('rkey',i,[]);
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm4.N3Click(Sender: TObject);
begin
 try
  form6:=tform6.Create(application);
  form6.ppDB64.OpenDataSource:=false;
  form6.ppReport1.Reset;
  case (Sender AS  tMenuitem).Tag of
  0:
   form6.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'packlist_list_Areport.rtm';
  1:
   form6.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'packlist_list_Areport2.rtm';
  2:
   form6.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'packlist_list_Areport3.rtm';
  3:
   form6.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'packlist_list_Areport4.rtm';
  end;
  form6.ppReport1.Template.LoadFromFile;
  form6.ppReport1.SaveAsTemplate:=true;
  form6.ppdesigner1.ShowModal;

 finally
  form6.free;
 end;
end;

procedure TForm4.N11Click(Sender: TObject);
begin
  if (dm.ADO0439cod_flag.Value = 'Y') and (dm.sql_codflag(dm.ADO0439rkey.Value)) then   //(V_pk - V_defi > 0.1) then

    showmsg('客户为款到发货标识,PO号:'+dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString+
            ':可出货总数:'+dm.ADOQuery1.fieldbyname('qty').AsString+'少于已出货总数:'+
    dm.ADOQuery1.fieldbyname('qtyed').AsString,1)
  else
    try
      form6:=tform6.Create(application);
      form6.aq0439.Close;
      form6.aq0439.Parameters[0].Value:=dm.ADO0439rkey.Value;
      form6.aq0439.Open;

      form6.ppReport1.Reset;
      case (Sender as TMenuItem).Tag of
        0:
        form6.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'packlist_list_Areport.rtm';       //R:\NIERP\Report\packlist_list_Areport.rtm
        1:
        form6.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'packlist_list_Areport2.rtm';       //R:\NIERP\Report\packlist_list_Areport2.rtm
        2:
        form6.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'packlist_list_Areport3.rtm';      //R:\NIERP\Report\packlist_list_Areport3.rtm
        3:
        form6.ppReport1.Template.FileName :=
          stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
            'packlist_list_Areport4.rtm';             //R:\NIERP\Report\packlist_list_Areport4.rtm
      end;
      form6.ppReport1.Template.LoadFromFile;
      form6.ppReport1.SaveAsTemplate:=false;

      form6.ppReport1.Print;

      if dm.ADO0439print_date.AsVariant=null then
        if messagedlg('是否将该张作业单标识成已打印?',mtconfirmation,[mbYes,mbNo],0)=mryes then
        begin
          dm.ADO0439.Edit;
          dm.ADO0439print_date.Value:=getsystem_date(dm.ADOQuery1,1);
          dm.ADO0439.Post;
        end;
      self.BtBrushClick(sender);
    finally
      form6.free;
    end;
end;

end.
