unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGridEh, Menus,DateUtils;

type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    Edit4: TEdit;
    DBGrd: TDBGridEh;
    Popup1: TPopupMenu;
    Popup2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DBGrdTitleClick(Column: TColumnEh);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure item_Click(Sender: TObject);
    procedure Calculation(Sender:TObject);
    procedure DBGrdEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure N6Click(Sender: TObject);
    procedure Popup2Popup(Sender: TObject);
  private
    { Private declarations }
    preColumn:TColumnEh;
    total_MATL_amount,total_tax_amount,total_INV_TOTAL:Double;
    sortDate,longDate:TDateTime;
    //sql_Text:string;
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses common, Seach, Add, dmo, Supplier;

{$R *.dfm}

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  if not app_init_2(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  with DM.ADO127 do
  begin
    Close;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select getdate() as v_dt');
      Active:=True;
      sortDate:=StrToDate(DateToStr(fieldvalues['v_dt']));
      longDate:=fieldvalues['v_dt'];
    end;
    Parameters[0].Value:=sortDate-dayof(sortDate)+1;
    Parameters[1].Value:=sortDate;
    Open;
  end;
  preColumn:=DBGrd.Columns[0];
  Label4.Caption:=preColumn.Title.Caption;
  total_MATL_amount:=0;    //不含税金额总计
  total_tax_amount:=0;      //税金总计
  total_INV_TOTAL:=0;   //总计金额
end;

procedure TForm_Main.DBGrdTitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker=smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADO127.IndexFieldNames:=Column.FieldName+' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADO127.IndexFieldNames:=Column.FieldName;
  end;
  if preColumn.FieldName<>Column.FieldName then
  begin
    if (Column.Title.Caption<>'发票日期') and (Column.Title.Caption<>'对帐日期') and (Column.Title.Caption<>'不含税金额')
    and (Column.Title.Caption<>'税金') and (Column.Title.Caption<>'税率%')and (Column.Title.Caption<>'总计金额')
    and (Column.Title.Caption<>'货款年度')and (Column.Title.Caption<>'货款月份') and (Column.Title.Caption<>'保存时间')  then
    begin
      Label4.Caption:=Column.Title.Caption;
      preColumn.Title.Color:=clBtnFace;
      Column.Title.Color:=clRed;
    end
    else
    begin
      preColumn.Title.Color:=clBtnFace;
    end;
    preColumn:=Column;
    Edit4.Text:='';
    Edit4.SetFocus;
  end;
end;

procedure TForm_Main.Edit4Change(Sender: TObject);
begin
  if Trim(Edit4.Text)<>'' then
  begin
    DM.ADO127.Filter:=preColumn.FieldName+' like ''%'+trim(Edit4.Text)+'%''';
  end
  else
  begin
    DM.ADO127.Filter:='';
  end;
end;

procedure TForm_Main.BitBtn5Click(Sender: TObject);
begin
  Popup1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm_Main.BitBtn4Click(Sender: TObject);
var
  i:Byte;
begin
  Form_Seach:=TForm_Seach.Create(Application);
  Form_Seach.DateTimePicker1.Date:=DM.ADO127.Parameters[0].Value;
  Form_Seach.DateTimePicker2.Date:=DM.ADO127.Parameters[1].Value;
  if Form_Seach.ShowModal=mrok then
  begin
    with DM.ADO127 do
    begin
      Close;
      CommandText:=Seach.sql;  //sql_Text;
      Parameters[0].Value:=Form_Seach.DateTimePicker1.Date;
      Parameters[1].Value:=Form_Seach.DateTimePicker2.Date;
      for i := 1 to Form_Seach.SGrid.RowCount-2 do
      begin
        CommandText:=CommandText+Form_Seach.SGrid.Cells[2,i];
      end;
      Open;
      Calculation(Sender);
    end;
  end;
end;

procedure TForm_Main.BitBtn3Click(Sender: TObject);
begin
  if not DM.ADO127.IsEmpty then
  begin
    Export_dbGridEH_to_Excel(DBGrd,Application.Title);
  end;
end;

procedure TForm_Main.BitBtn2Click(Sender: TObject);
begin
  DM.ADO127.Close;
  DM.ADO127.Open;
  Calculation(Sender);
  Edit4.Text:='';
  Edit4.SetFocus;
end;

procedure TForm_Main.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    Form_Add:=TForm_Add.Create(Application);
    Form_Add.DateTimePicker1.Date:= sortDate;
    Form_Add.DateTimePicker2.Date:=sortDate;
    Form_Add.flag:=0;
    with DM.qryTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select CURR_FYEAR,CURR_PERIOD from dbo.Data0508');
      Open;
      Form_Add.UpDown1.Position:=FieldByName('CURR_FYEAR').Value;
      Form_Add.UpDown2.Position:=FieldByName('CURR_PERIOD').Value;      
    end;
    DM.ADO127A.Close;
    DM.ADO127A.Parameters[0].Value:=null;
    DM.ADO127A.Open;
    DM.ADO127A.Append;
    if Form_Add.ShowModal=mrok then
    begin
      DM.ADO73.Close;
      DM.ADO73.Parameters[0].Value:=rkey73;
      DM.ADO73.Open;
      DM.ADOConn.BeginTrans;
      try
        DM.ADO127Ainvoice_number.Value:=trim(Form_Add.Edit1.Text);
        DM.ADO127Ainvoice_no.Value:=trim(Form_Add.Edit2.Text);
        DM.ADO127Agoods_name.Value:=Trim(Form_Add.Edit15.Text);
        DM.ADO127Atax_number.Value:=Trim(Form_Add.Edit16.Text);
        DM.ADO127Asupp_ptr.Value:=Form_Add.Edit3.Tag;
        DM.ADO127Ainvoice_date.Value:=Form_Add.DateTimePicker1.Date;
        DM.ADO127Aaccount_date.Value:=Form_Add.DateTimePicker2.Date;
        DM.ADO127Amatl_year.Value:=Form_Add.UpDown1.Position;
        DM.ADO127Amatl_month.Value:=Form_Add.UpDown2.Position;
        DM.ADO127AMATL_amount.Value:=StrToFloat(Trim(Form_Add.Edit7.Text));
        DM.ADO127Atax_amount.Value:=StrToFloat(Form_Add.Edit9.Text);
        DM.ADO127Atax.Value:=StrToFloat(Form_Add.Edit8.Text);
        DM.ADO127AINV_TOTAL.Value:=StrToFloat(Trim(Form_Add.Edit10.Text));
        DM.ADO127Atotal_matl_amount.Value:=StrToFloat(Form_Add.Edit13.Text);
        DM.ADO127Atotal_tax_amount.Value:=StrToFloat(Form_Add.Edit14.Text);
        DM.ADO127Apause_matl_amount.Value:=StrToFloat(Form_Add.Edit17.Text);
        DM.ADO127Apause_tax_amount.Value:=StrToFloat(Form_Add.Edit18.Text);
        DM.ADO127Aremark.Value:=Trim(Form_Add.Edit11.Text);
        DM.ADO127Auser_ptr.Value:=DM.ADO73employee_ptr.Value;
        DM.ADO127Awarehouse_ptr.Value:=Form_Add.Edit12.Tag;
        DM.ADO127Aent_date.Value:= longDate;
    //    DM.ADO127Auser_ptr.Value:=1919;
        DM.ADO127A.Post;
        DM.ADOConn.CommitTrans;
      except
        on E:Exception do
        begin
        DM.ADO127A.Cancel;
        DM.ADOConn.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0)
        end;
      end;
      BitBtn2Click(Sender);
      DM.ADO127.Locate('rkey',DM.ADO127Arkey.Value,[]);
      DM.ADO127A.Close;
    end;
  end;
end;

procedure TForm_Main.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    if DM.ADO127GLPTR_STATUS.Value = true then
    begin
      MessageDlg('税票已生成凭证，不能编辑!',mtInformation,[mbOK],0);
    end
    else
    begin
      Form_Add:=TForm_Add.Create(Application);
      Form_Add.flag:=1;
      DM.ADO127A.Close;
      DM.ADO127A.Parameters[0].Value:=DM.ADO127rkey.Value;
      DM.ADO127A.Open;
      DM.ADO127A.Edit;
      with Form_Add do
      begin
        ADO23.Close;
        ADO23.Parameters[0].Value:=DM.ADO127supp_ptr.Value;
        ADO23.Open;
        Edit1.Text:=DM.ADO127invoice_number.Value;
        code1:=DM.ADO127invoice_number.Value;
        Edit2.Text:=DM.ADO127invoice_no.Value;
        code2:=DM.ADO127invoice_no.Value;
        Edit3.Text:=ADO23CODE.Value;
        Edit3.Tag:=ADO23RKEY.Value;
        Label13.Caption:=ADO23SUPPLIER_NAME.Value;
        Edit4.Text:=ADO23ANALYSIS_CODE1.Value;
        DateTimePicker1.Date:=DM.ADO127invoice_date.Value;
        DateTimePicker2.Date:=DM.ADO127account_date.Value;
        UpDown1.Position:=DM.ADO127matl_year.Value;
        UpDown2.Position:=DM.ADO127matl_month.Value;
        Edit7.Text:=DM.ADO127MATL_amount.Text;
        Edit8.Text:=DM.ADO127tax.Text;
        Edit9.Text:=DM.ADO127tax_amount.Text;
        Edit10.Text:=DM.ADO127INV_TOTAL.Text;
        Edit11.Text:=DM.ADO127remark.Value;
        Edit12.Text:=DM.ADO127warehouse_code.Value;
        Edit12.Tag:=dm.ADO127warehouse_ptr.Value;
        Label17.Caption:=DM.ADO127warehouse_name.Value;
        Edit15.Text:=dm.ADO127goods_name.Value;
        Edit16.Text:=dm.ADO127tax_number.Value;
        Edit13.Text:=dm.ADO127total_matl_amount.AsString;
        Edit14.Text:=DM.ADO127total_tax_amount.AsString;
        Edit17.Text:=dm.ADO127pause_matl_amount.AsString;
        Edit18.Text:=DM.ADO127pause_tax_amount.AsString;
        BitBtn3.Enabled:=False;
        Edit5.ReadOnly:=True;
        Edit6.ReadOnly:=True;
        UpDown1.Enabled:=False;
        UpDown2.Enabled:=False;
      end;
      if Form_Add.ShowModal=mrok then
      begin
       with dm.ADOQuery1 do
       begin
        Close;
        sql.Clear;
        sql.Add('select isnull(max(rkey),0) as mrkey from data0127');
        sql.Add('where matl_year='+form_add.Edit5.Text);
        sql.Add('and matl_month='+form_add.Edit6.Text);
        sql.Add('and supp_ptr='+inttostr(form_add.Edit3.Tag));
        Open;
       end;
       if (dm.ADO127rkey.Value<DM.ADOQuery1.FieldByName('mrkey').Value) and ((StrToFloat(Form_Add.Edit7.Text)<>DM.ADO127MATL_amount.Value) or (StrToFloat(Form_Add.Edit9.Text)<>DM.ADO127tax_amount.Value)) then
       begin
        MessageDlg('这不是同年同月同供应商的最后一张税票信息,不能编辑税额相关信息!',mtInformation,[mbOK],1);
        Exit;
       end
       else
       begin
        DM.ADO73.Close;
        DM.ADO73.Parameters[0].Value:=rkey73;
        DM.ADO73.Open;
        DM.ADOConn.BeginTrans;
        try
          DM.ADO127Ainvoice_number.Value:=trim(Form_Add.Edit1.Text);
          DM.ADO127Ainvoice_no.Value:=trim(Form_Add.Edit2.Text); 
          DM.ADO127Asupp_ptr.Value:=Form_Add.Edit3.Tag;
          DM.ADO127Ainvoice_date.Value:=Form_Add.DateTimePicker1.Date;
          DM.ADO127Aaccount_date.Value:=Form_Add.DateTimePicker2.Date;
          DM.ADO127Amatl_year.Value:=Form_Add.UpDown1.Position;
          DM.ADO127Amatl_month.Value:=Form_Add.UpDown2.Position;
          DM.ADO127AMATL_amount.Value:=StrToFloat(Trim(Form_Add.Edit7.Text));
          DM.ADO127Atax_amount.Value:=StrToFloat(Form_Add.Edit9.Text);
          DM.ADO127Atax.Value:=StrToFloat(Form_Add.Edit8.Text);
          DM.ADO127AINV_TOTAL.Value:=StrToFloat(Trim(Form_Add.Edit10.Text));
          DM.ADO127Aremark.Value:=Trim(Form_Add.Edit11.Text);
          DM.ADO127Auser_ptr.Value:=DM.ADO73employee_ptr.Value;
          DM.ADO127Awarehouse_ptr.Value:=Form_Add.Edit12.Tag;
          DM.ADO127Agoods_name.Value:=Trim(Form_Add.Edit15.Text);
          DM.ADO127Atax_number.Value:=Trim(Form_Add.Edit16.Text);
          DM.ADO127Atotal_matl_amount.Value:=StrToFloat(Form_Add.Edit13.Text);
          DM.ADO127Atotal_tax_amount.Value:=StrToFloat(Form_Add.Edit14.Text);
          dm.ADO127Apause_matl_amount.Value:=StrToFloat(Form_Add.Edit17.Text);
          dm.ADO127Apause_tax_amount.Value:=StrToFloat(Form_Add.Edit18.Text);
          DM.ADO127A.Post;
          DM.ADOConn.CommitTrans;
        except
          DM.ADO127A.Cancel;
          DM.ADOConn.RollbackTrans;
        end;
        BitBtn2Click(Sender);
        DM.ADO127.Locate('rkey',DM.ADO127Arkey.Value,[]);
        DM.ADO127A.Close;
       end;
      end;
    end;
  end;
end;

procedure TForm_Main.N3Click(Sender: TObject);
begin
  Form_Add:=TForm_Add.Create(Application);
  with Form_Add do
  begin
    flag:=4;
    ADO23.Close;
    ADO23.Parameters[0].Value:=DM.ADO127supp_ptr.Value;
    ADO23.Open;
    Edit1.Text:=DM.ADO127invoice_number.Value;
    Edit2.Text:=DM.ADO127invoice_no.Value;
    Edit3.Text:=ADO23CODE.Value;
    Label13.Caption:=ADO23SUPPLIER_NAME.Value;
    Edit4.Text:=ADO23ANALYSIS_CODE1.Value;
    DateTimePicker1.Date:=DM.ADO127invoice_date.Value;
    DateTimePicker2.Date:=DM.ADO127account_date.Value;
    UpDown1.Position:=DM.ADO127matl_year.Value;
    UpDown2.Position:=DM.ADO127matl_month.Value;
    Edit7.Text:=DM.ADO127MATL_amount.Text;
    Edit8.Text:=DM.ADO127tax.Text;
    Edit9.Text:=DM.ADO127tax_amount.Text;
    Edit10.Text:=DM.ADO127INV_TOTAL.Text;
    Edit11.Text:=DM.ADO127remark.Value;
    Edit12.Text:=DM.ADO127warehouse_code.Value;
    Label17.Caption:=DM.ADO127warehouse_name.Value;
    Edit15.Text:=dm.ADO127goods_name.Value;
    Edit16.Text:=dm.ADO127tax_number.Value;
    Edit13.Text:=dm.ADO127total_matl_amount.AsString;
    Edit14.Text:=DM.ADO127total_tax_amount.AsString;
    Edit17.Text:=dm.ADO127pause_matl_amount.AsString;
    Edit18.Text:=DM.ADO127pause_tax_amount.AsString;
    Edit1.Enabled:=False;
    Edit2.Enabled:=False;
    BitBtn3.Enabled:=False;
    Edit4.Enabled:=False;
    DateTimePicker1.Enabled:=False;
    DateTimePicker2.Enabled:=False;
    Edit5.Enabled:=False;
    Edit6.Enabled:=False;
    Edit7.Enabled:=False;
    Edit8.Enabled:=False;
    Edit9.Enabled:=False;
    Edit11.Enabled:=False;
    Edit15.Enabled:=False;
    Edit16.Enabled:=False;
    BitBtn1.Enabled:=False;
    BitBtn4.Enabled:=False;
    ShowModal;
  end;
end;

procedure TForm_Main.N5Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    if DM.ADO127GLPTR_STATUS.Value = true then
      MessageDlg('税票已生成凭证，不能编辑!',mtInformation,[mbOK],0)
    else
    begin
      if MessageBox(Handle,'数据一旦删除无法恢复，是否确定要删除？','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=idno then
        Exit;
       with dm.ADOQuery1 do
       begin
        Close;
        sql.Clear;
        sql.Add('select isnull(max(rkey),0) as mrkey from data0127');
        sql.Add('where matl_year='+dm.ADO127matl_year.AsString);
        sql.Add('and matl_month='+dm.ADO127matl_month.AsString);
        sql.Add('and supp_ptr='+dm.ADO127supp_ptr.AsString);
        Open;
       end;
       if dm.ADO127rkey.Value<DM.ADOQuery1.FieldByName('mrkey').Value then
       begin
        MessageDlg('这不是同供应商同年同月的最后一张税票信息,不能删除!',mtInformation,[mbOK],1);
        Exit;
       end;
      DM.ADOConn.BeginTrans;
      try
        DM.ADO127A.Close;
        DM.ADO127A.Parameters[0].Value:=DM.ADO127rkey.Value;
        DM.ADO127A.Open;
        DM.ADO127A.Delete;
        BitBtn2Click(Sender);
        DM.ADO127.Locate('rkey',DM.ADO127Arkey.Value,[]);
        DM.ADO127A.Close;
        DM.ADOConn.CommitTrans;
      except
        DM.ADOConn.RollbackTrans;
      end;
    end;
  end;
end;

procedure TForm_Main.FormShow(Sender: TObject);
var
  i:Byte;
  item:TMenuItem;
begin
  if DM.ADOConn.Connected then
  begin
    //sql_Text:=DM.ADO127.CommandText;
    Calculation(Sender);
    for i := 0 to DBGrd.Columns.Count-1 do
    begin
      item:=TMenuItem.Create(Self);
      item.Caption:=DBGrd.Columns[i].Title.Caption;
      item.Checked:=DBGrd.Columns[i].Visible;
      Popup1.Items.Add(item);
      item.OnClick:=item_Click;
    end;
    Form_Add:=TForm_Add.Create(Application);
    with Form_Add do
    begin
      Edit1.Enabled:=True;
      Edit2.Enabled:=True;
      BitBtn3.Enabled:=True;
      Edit4.Enabled:=True;
      DateTimePicker1.Enabled:=True;
      DateTimePicker2.Enabled:=True;
      Edit5.Enabled:=True;
      Edit6.Enabled:=True;
      Edit7.Enabled:=True;
      Edit9.Enabled:=True;
      Edit11.Enabled:=True;
      BitBtn1.Enabled:=True;
    end;
  end;
end;

procedure TForm_Main.item_Click(Sender: TObject);
var
  i:Byte;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i := 0 to DBGrd.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrd.Columns[i].Title.Caption then
      begin
        DBGrd.Columns[i].Visible:=True;
        Break;
      end;
    end;
  end
  else
  begin
    for i := 0 to DBGrd.Columns.Count-1 do
    begin
      if (Sender as TMenuItem).Caption=DBGrd.Columns[i].Title.Caption then
      begin
        DBGrd.Columns[i].Visible:=False;
        Break;
      end;
    end;
  end;
end;

procedure TForm_Main.DBGrdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(DM.ADO127.CommandText);
end;

procedure TForm_Main.Calculation(Sender:TObject);
begin
  total_MATL_amount:=0;
  total_tax_amount:=0;
  total_INV_TOTAL:=0;
  dm.ADO127.DisableControls;
  while not DM.ADO127.Eof do
  begin
    total_MATL_amount:= total_MATL_amount+DM.ADO127MATL_amount.Value;
    total_tax_amount:= total_tax_amount+DM.ADO127tax_amount.Value;
    total_INV_TOTAL:= total_INV_TOTAL+DM.ADO127INV_TOTAL.Value;
    DM.ADO127.Next;
  end;
  DM.ADO127.First;
  DM.ADO127.EnableControls;
  Edit1.Text:=FormatFloat('0.00',total_MATL_amount);
  Edit2.Text:=FormatFloat('0.00',total_tax_amount);
  Edit3.Text:=FormatFloat('0.00',total_INV_TOTAL);
end;

procedure TForm_Main.DBGrdEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  Calculation(Sender);
end;

procedure TForm_Main.N6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  begin
    try
      Form_Add:=TForm_Add.Create(Application);
      Form_Add.DateTimePicker1.Date:= sortDate;
      Form_Add.DateTimePicker2.Date:=sortDate;
      Form_Add.flag:=3;
      DM.ADO127A.Close;
      DM.ADO127A.Parameters[0].Value:=DM.ADO127rkey.Value;
      DM.ADO127A.Open;
      with Form_Add do
      begin
        ADO23.Close;
        ADO23.Parameters[0].Value:=DM.ADO127supp_ptr.Value;
        ADO23.Open;
        Edit1.Text:=DM.ADO127invoice_number.Value;
        Edit3.Text:=ADO23CODE.Value;
        Edit3.Tag:=ADO23RKEY.Value;
        Label13.Caption:=ADO23SUPPLIER_NAME.Value;
        Edit4.Text:=ADO23ANALYSIS_CODE1.Value;
        DateTimePicker1.Date:=DM.ADO127invoice_date.Value;
        DateTimePicker2.Date:=DM.ADO127account_date.Value;
        UpDown1.Position:=DM.ADO127matl_year.Value;
        UpDown2.Position:=DM.ADO127matl_month.Value;
        Edit8.Text:=DM.ADO127tax.Text;
        Edit15.Text:=dm.ADO127goods_name.Value;
        Edit16.Text:=dm.ADO127tax_number.Value;
      end;
      DM.ADO127A.Append;
      if Form_Add.ShowModal=mrok then
      begin
        DM.ADO73.Close;
        DM.ADO73.Parameters[0].Value:=rkey73;
        DM.ADO73.Open;
        DM.ADOConn.BeginTrans;
        try
          DM.ADO127Ainvoice_number.Value:=trim(Form_Add.Edit1.Text);
          DM.ADO127Ainvoice_no.Value:=trim(Form_Add.Edit2.Text);
          DM.ADO127Asupp_ptr.Value:=Form_Add.Edit3.Tag;
          DM.ADO127Ainvoice_date.Value:=Form_Add.DateTimePicker1.Date;
          DM.ADO127Aaccount_date.Value:=Form_Add.DateTimePicker2.Date;
          DM.ADO127Amatl_year.Value:=Form_Add.UpDown1.Position;
          DM.ADO127Amatl_month.Value:=Form_Add.UpDown2.Position;
          DM.ADO127AMATL_amount.Value:=StrToFloat(Trim(Form_Add.Edit7.Text));
          DM.ADO127Atax_amount.Value:=StrToFloat(Form_Add.Edit9.Text);
          DM.ADO127Atax.Value:=StrToFloat(Form_Add.Edit8.Text);
          DM.ADO127AINV_TOTAL.Value:=StrToFloat(Trim(Form_Add.Edit10.Text));
          DM.ADO127Aremark.Value:=Trim(Form_Add.Edit11.Text);
          DM.ADO127Auser_ptr.Value:=DM.ADO73employee_ptr.Value;
          DM.ADO127Awarehouse_ptr.Value:=Form_Add.Edit12.Tag;
          DM.ADO127Aent_date.Value:= longDate;
          DM.ADO127Atotal_matl_amount.Value:=StrToFloat(Form_Add.Edit13.Text);
          DM.ADO127Atotal_tax_amount.Value:=StrToFloat(Form_Add.Edit14.Text);
          DM.ADO127Apause_matl_amount.Value:=StrToFloat(Form_Add.Edit17.Text);
          DM.ADO127Apause_tax_amount.Value:=StrToFloat(Form_Add.Edit18.Text);
          DM.ADO127Atax_number.Value:=Form_Add.Edit16.Text;
          DM.ADO127Agoods_name.Value:=Form_Add.Edit15.Text;
      //    DM.ADO127Auser_ptr.Value:=1919;
          DM.ADO127A.Post;
          DM.ADOConn.CommitTrans;
        except
          DM.ADO127A.Cancel;
          DM.ADOConn.RollbackTrans;
        end;
        BitBtn2Click(Sender);
        DM.ADO127.Locate('rkey',DM.ADO127Arkey.Value,[]);
        DM.ADO127A.Close;
      end;
    finally
      Form_Add.Free;
    end;
  end;
end;

procedure TForm_Main.Popup2Popup(Sender: TObject);
begin
 if DM.ADO127.IsEmpty then
 begin
   N2.Enabled:=False;
   N3.Enabled:=False;
   N5.Enabled:=False;
   N6.Enabled:=False;
 end
 else
 begin
   N2.Enabled:=True;
   N3.Enabled:=True;
   N5.Enabled:=True;
   N6.Enabled:=True;
 end;
end;

end.
