unit PasOrderParameter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB,DateUtils;

type
  TFrmOrderParameter = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Button1: TButton;
    DBGridEh1: TDBGridEh;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Button2: TButton;
    tmp: TADOQuery;
    ADODataSet1: TADODataSet;
    ADODataSet2: TADODataSet;
    DataSource2: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Sqlstr:string;
    StartDate,EndDate:TDatetime;
    PreColumn: TColumnEh;
    field_name:string;
    ListDEPT: TStringList; //存列表
    procedure item_click(sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmOrderParameter: TFrmOrderParameter;

implementation
uses common,PasPublic,PasSetParameter, PasQuery, pasD80_278;


{$R *.dfm}
procedure TFrmOrderParameter.item_click(Sender: TObject);
var
  i:byte;
begin
  (Sender as TmenuItem).Checked := not ((Sender as TmenuItem).Checked);
  if (Sender as TmenuItem).Checked then
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := True ;
      Break;
    end ;
  end
  else
  begin
    for i := 0 to DBGridEh1.FieldCount - 1 do
    if DBGridEh1.Columns[i].Title.Caption = (Sender as TmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible := False ;
      Break;
    end ;
  end ;
end;

procedure TFrmOrderParameter.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOrderParameter.Button1Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  FrmSetParameter:=TFrmSetParameter.Create(application);
  FrmSetParameter.ShowModal;
  FrmSetParameter.Free;
end;

procedure TFrmOrderParameter.FormCreate(Sender: TObject);
begin
//  if not App_init_2(ADOConnection1) then
//  begin
//    showmsg('程序启动失败,请与管理员联系!',1);
//    application.Terminate;
//  end;
//  self.Caption:=application.Title;

 rkey73:='2525';
 user_ptr := '100';
 vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TFrmOrderParameter.BitBtn2Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
    tmpAdo,tmpAdo2:TADOQuery;
    Date1,Date2:TDateTime;
    item:TMenuItem;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  if StartDate > 100 then
    FrmQuery.DTPk1.Date:= StartDate
  else
    FrmQuery.DTPk1.Date:=StartOfTheMonth(now);
  if EndDate > 100 then
    FrmQuery.DTPk2.Date:= EndDate
  else
    FrmQuery.DTPk2.Date:=EndOfTheMonth(Now);
  FrmQuery.ListBox3.ItemIndex := FrmQuery.iItem;
  self.PopupMenu1.Items.Clear;
  if FrmQuery.ShowModal=mrok then
  begin
    Edit1.Enabled:=True;
    screen.Cursor:=crHourGlass;
    if (FrmQuery.RadioGroup2.ItemIndex=1) then
    begin
      Sqlstr:='';
      iNo:=0;
      Date1:=StrToDateTime(formatdatetime('yyyy-MM-dd',FrmQuery.DTPk1.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DTTm1.Time));
      Date2:=StrToDateTime(formatdatetime('yyyy-MM-dd',FrmQuery.DTPk2.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DTTm2.Time));
      for i:=1 to FrmQuery.SGrid1.RowCount-2 do
      if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
      try
        tmpAdo:=TADOQuery.Create(Application);
        tmpAdo.Connection:=ADOConnection1;
        tmpAdo2:=TADOQuery.Create(Application);
        tmpAdo2.Connection:=ADOConnection1;
        DBGridEh1.SumList.Active:=False;
        DBGridEh1.DataSource:=DataSource1;
//        ADODataSet1.DisableControls;
        ADODataSet1.Close;
        ADODataSet1.CommandText:='exec dbo.Proc_ep060492_MX2 ''' +Sqlstr+FrmQuery.AddSQLTxt+' ''';
//        ShowMessage(ADODataSet1.CommandText);
        StartDate:=FrmQuery.DTPk1.Date;
        EndDate:=FrmQuery.DTPk2.Date;
        ADODataSet1.Prepared;
        ADODataSet1.Open;
        if (not ADODataSet1.IsEmpty) then
        begin
          for i:=DBGridEh1.Columns.Count downto 1 do
          begin
            DBGridEh1.Columns.Delete(i-1);
          end;
          for i:=0 to 27 do
          begin
            DBGridEh1.Columns.Add.FieldName:=ADODataSet1.Fields.Fields[i].FieldName;
          end;
          DBGridEh1.Columns[0].Title.Caption:='作业单号';
          DBGridEh1.Columns[0].Width:=110;
          DBGridEh1.Columns[1].Title.Caption:='工序代码';
          DBGridEh1.Columns[1].Width:=60;
          DBGridEh1.Columns[2].Title.Caption:='工序名称';
          DBGridEh1.Columns[2].Width:=80;
          DBGridEh1.Columns[3].Title.Caption:='步骤';
          DBGridEh1.Columns[3].Width:=45;
          DBGridEh1.Columns[4].Title.Caption:='作业单状态';
          DBGridEh1.Columns[4].Width:=80;
          DBGridEh1.Columns[5].Title.Caption:='客户代码';
          DBGridEh1.Columns[5].Width:=110;
          DBGridEh1.Columns[6].Title.Caption:='本厂编号';
          DBGridEh1.Columns[6].Width:=120;
          DBGridEh1.Columns[7].Title.Caption:='客户型号';
          DBGridEh1.Columns[7].Width:=100;
          DBGridEh1.Columns[8].Title.Caption:='测试成型备注';
          DBGridEh1.Columns[8].Width:=110;
          DBGridEh1.Columns[9].Title.Caption:='PCS单只尺寸';
          DBGridEh1.Columns[9].Width:=130;
          DBGridEh1.Columns[10].Title.Caption:='产品类型';
          DBGridEh1.Columns[10].Width:=90;
          DBGridEh1.Columns[11].Title.Caption:='配料单号';
          DBGridEh1.Columns[11].Width:=120;
          DBGridEh1.Columns[12].Title.Caption:='销售订单号';
          DBGridEh1.Columns[12].Width:=100;
          DBGridEh1.Columns[13].Title.Caption:='客户订单号';
          DBGridEh1.Columns[13].Width:=100;
          DBGridEh1.Columns[14].Title.Caption:='订单参考';
          DBGridEh1.Columns[14].Width:=90;
          DBGridEh1.Columns[15].Title.Caption:='下单日期';
          DBGridEh1.Columns[15].Width:=90;
          DBGridEh1.Columns[16].Title.Caption:='回复交期';
          DBGridEh1.Columns[16].Width:=90;
          DBGridEh1.Columns[17].Title.Caption:='投产日期';
          DBGridEh1.Columns[17].Width:=120;
          DBGridEh1.Columns[18].Title.Caption:='计划完工日期';
          DBGridEh1.Columns[18].Width:=90;
          DBGridEh1.Columns[19].Title.Caption:='订单数量';
          DBGridEh1.Columns[19].Width:=65;
          DBGridEh1.Columns[19].Footer.FieldName:='ORD_REQ_QTY';
          DBGridEh1.Columns[19].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[20].Title.Caption:='欠货数量';
          DBGridEh1.Columns[20].Width:=65;
          DBGridEh1.Columns[20].Footer.FieldName:='ownQty';
          DBGridEh1.Columns[20].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[21].Title.Caption:='投产数量';
          DBGridEh1.Columns[21].Width:=65;
          DBGridEh1.Columns[21].Footer.FieldName:='ISSUED_QTY';
          DBGridEh1.Columns[21].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[22].Title.Caption:='A板数量';
          DBGridEh1.Columns[22].Width:=65;
          DBGridEh1.Columns[22].Footer.FieldName:='PANEL_1_QTY';
          DBGridEh1.Columns[22].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[23].Title.Caption:='B板数量';
          DBGridEh1.Columns[23].Width:=65;
          DBGridEh1.Columns[23].Footer.FieldName:='PANEL_2_QTY';
          DBGridEh1.Columns[23].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[24].Title.Caption:='在制数量';
          DBGridEh1.Columns[24].Width:=65;
          DBGridEh1.Columns[24].Footer.FieldName:='WIP_QTY';
          DBGridEh1.Columns[24].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[25].Title.Caption:='在线数量pan';
          DBGridEh1.Columns[25].Width:=75;
          DBGridEh1.Columns[25].Footer.FieldName:='PANELS';
          DBGridEh1.Columns[25].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[26].Title.Caption:='报废数量';
          DBGridEh1.Columns[26].Width:=65;
          DBGridEh1.Columns[26].Footer.FieldName:='QTY_REJECT';
          DBGridEh1.Columns[26].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[27].Title.Caption:='完工数量';
          DBGridEh1.Columns[27].Width:=65;
          DBGridEh1.Columns[27].Footer.FieldName:='FG_QTY';
          DBGridEh1.Columns[27].Footer.ValueType:=fvtSum;

          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Add('select * from dbo.data0057 order by iSort');
          tmpAdo.Open;
          tmpAdo2.Close;
          tmpAdo2.SQL.Clear;
          tmpAdo2.SQL.Add('select * from dbo.data0080 order by iSort');
          tmpAdo2.Open;
          if (not tmpAdo2.IsEmpty) then
          begin
            tmpAdo2.First;
            for i :=0  to DBGridEh1.Columns.Count-1 do
            begin
              if (DBGridEh1.Columns[i].FieldName=tmpAdo2.FieldByName('ColName').AsString) then
              begin
                iNo:=1;
                Break;
              end;
            end;
            if (iNo=1) then
            begin
              for i :=tmpAdo2.RecordCount  downto 1 do
              begin
                DBGridEh1.Columns.Delete(DBGridEh1.Columns.Count-tmpAdo.RecordCount-i);
              end;
            end;
          end;

          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Add('select * from dbo.data0057 order by iSort');
          tmpAdo.Open;
          if (not tmpAdo.IsEmpty) then
          begin
            tmpAdo.First;
            for i :=0  to DBGridEh1.Columns.Count-1 do
            begin
              if (DBGridEh1.Columns[i].FieldName=tmpAdo.FieldByName('ColName').AsString) then
              begin
                iNo:=1;
                Break;
              end;
            end;
            if (iNo=1) then
            begin
              for i :=tmpAdo.RecordCount  downto 1 do
              begin
                DBGridEh1.Columns.Delete(DBGridEh1.Columns.Count-i);
              end;
            end;
          end;
          tmpAdo2.First;
          while not tmpAdo2.Eof do
          begin
            with DBGridEh1.Columns.Add do
            begin
              FieldName:=tmpAdo2.FieldBYName('ColName').AsString;
              Width:=60;
            end;
            tmpAdo2.Next;
          end;
          tmpAdo.First;
          while not tmpAdo.Eof do
          begin
            with DBGridEh1.Columns.Add do
            begin
              FieldName:=tmpAdo.FieldBYName('ColName').AsString;
              Width:=60;
            end;
            tmpAdo.Next;
          end;
        end;
        ADODataSet1.Close;
        ADODataSet1.CommandText:='exec  dbo.Proc_ep060492_MX2 ''' +Sqlstr+FrmQuery.AddSQLTxt+' ''';
        ADODataSet1.Open;
        DBGridEh1.SumList.Active:=True;
        field_name := DBGridEh1.Columns[0].FieldName;
        PreColumn := DBGridEh1.Columns[0];
        DBGridEh1.Columns[0].Title.Color := clred ;
        Label1.Caption:=preColumn.Title.Caption;
      finally
        tmpAdo.Close;
        tmpAdo.Connection:=nil;
        tmpAdo.Free;
        tmpAdo2.Close;
        tmpAdo2.Connection:=nil;
        tmpAdo2.Free;
//        ADODataSet1.EnableControls;
      end;
    end else
    if (FrmQuery.RadioGroup2.ItemIndex=0) then
    begin
      Sqlstr:='';
      iNo:=0;
      Date1:=StrToDateTime(formatdatetime('yyyy-MM-dd',FrmQuery.DTPk1.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DTTm1.Time));
      Date2:=StrToDateTime(formatdatetime('yyyy-MM-dd',FrmQuery.DTPk2.Date)+formatdatetime(' hh:nn:ss',FrmQuery.DTTm2.Time));
      DataSource2.Enabled:=True;
      for i:=1 to FrmQuery.SGrid1.RowCount-2 do
      if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
      try
        tmpAdo:=TADOQuery.Create(Application);
        tmpAdo.Connection:=ADOConnection1;
        tmpAdo2:=TADOQuery.Create(Application);
        tmpAdo2.Connection:=ADOConnection1;
//        ADODataSet2.DisableControls;
        DBGridEh1.SumList.Active:=False;
        DBGridEh1.DataSource:=DataSource2;
        ADODataSet2.Close;
        ADODataSet2.CommandText:='exec Proc_ep060492_MX ''' +Sqlstr+FrmQuery.AddSQLTxt+' ''';
        StartDate:=FrmQuery.DTPk1.Date;
        EndDate:=FrmQuery.DTPk2.Date;
        ADODataSet2.Prepared;
        ADODataSet2.Open;
        if (not ADODataSet2.IsEmpty) then
        begin
          for i:=DBGridEh1.Columns.Count downto 1 do
          begin
            DBGridEh1.Columns.Delete(i-1);
          end;
          for i:=0 to 22 do
          begin
            DBGridEh1.Columns.Add.FieldName:=ADODataSet2.Fields.Fields[i].FieldName;
          end;
          DBGridEh1.Columns[0].Title.Caption:='客户代码';
          DBGridEh1.Columns[0].Width:=110;
          DBGridEh1.Columns[1].Title.Caption:='本厂编号';
          DBGridEh1.Columns[1].Width:=120;
          DBGridEh1.Columns[2].Title.Caption:='客户型号';
          DBGridEh1.Columns[2].Width:=100;
          DBGridEh1.Columns[3].Title.Caption:='测试成型备注';
          DBGridEh1.Columns[3].Width:=110;
          DBGridEh1.Columns[4].Title.Caption:='PCS单只尺寸';
          DBGridEh1.Columns[4].Width:=130;
          DBGridEh1.Columns[5].Title.Caption:='产品类型';
          DBGridEh1.Columns[5].Width:=90;
          DBGridEh1.Columns[6].Title.Caption:='配料单号';
          DBGridEh1.Columns[6].Width:=120;
          DBGridEh1.Columns[7].Title.Caption:='销售订单号';
          DBGridEh1.Columns[7].Width:=100;
          DBGridEh1.Columns[8].Title.Caption:='客户订单号';
          DBGridEh1.Columns[8].Width:=100;
          DBGridEh1.Columns[9].Title.Caption:='订单参考';
          DBGridEh1.Columns[9].Width:=90;
          DBGridEh1.Columns[10].Title.Caption:='下单日期';
          DBGridEh1.Columns[10].Width:=90;
          DBGridEh1.Columns[11].Title.Caption:='回复交期';
          DBGridEh1.Columns[11].Width:=90;
          DBGridEh1.Columns[12].Title.Caption:='投产日期';
          DBGridEh1.Columns[12].Width:=120;
          DBGridEh1.Columns[13].Title.Caption:='计划完工日期';
          DBGridEh1.Columns[13].Width:=90;
          DBGridEh1.Columns[14].Title.Caption:='订单数量';
          DBGridEh1.Columns[14].Width:=65;
          DBGridEh1.Columns[14].Footer.FieldName:='ORD_REQ_QTY';
          DBGridEh1.Columns[14].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[15].Title.Caption:='欠货数量';
          DBGridEh1.Columns[15].Width:=65;
          DBGridEh1.Columns[15].Footer.FieldName:='ownQty';
          DBGridEh1.Columns[15].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[16].Title.Caption:='投产数量';
          DBGridEh1.Columns[16].Width:=65;
          DBGridEh1.Columns[16].Footer.FieldName:='ISSUED_QTY';
          DBGridEh1.Columns[16].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[17].Title.Caption:='A板数量';
          DBGridEh1.Columns[17].Width:=65;
          DBGridEh1.Columns[17].Footer.FieldName:='PANEL_1_QTY';
          DBGridEh1.Columns[17].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[18].Title.Caption:='B板数量';
          DBGridEh1.Columns[18].Width:=65;
          DBGridEh1.Columns[18].Footer.FieldName:='PANEL_2_QTY';
          DBGridEh1.Columns[18].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[19].Title.Caption:='在制数量';
          DBGridEh1.Columns[19].Width:=65;
          DBGridEh1.Columns[19].Footer.FieldName:='WIP_QTY';
          DBGridEh1.Columns[19].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[20].Title.Caption:='在线数量pan';
          DBGridEh1.Columns[20].Width:=75;
          DBGridEh1.Columns[20].Footer.FieldName:='zx_pan_qty';
          DBGridEh1.Columns[20].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[21].Title.Caption:='报废数量';
          DBGridEh1.Columns[21].Width:=65;
          DBGridEh1.Columns[21].Footer.FieldName:='QTY_REJECT';
          DBGridEh1.Columns[21].Footer.ValueType:=fvtSum;
          DBGridEh1.Columns[22].Title.Caption:='完工数量';
          DBGridEh1.Columns[22].Width:=65;
          DBGridEh1.Columns[22].Footer.FieldName:='FG_QTY';
          DBGridEh1.Columns[22].Footer.ValueType:=fvtSum;

          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Add('select * from dbo.data0057 order by iSort');
          tmpAdo.Open;
          tmpAdo2.Close;
          tmpAdo2.SQL.Clear;
          tmpAdo2.SQL.Add('select * from dbo.data0080 order by iSort');
          tmpAdo2.Open;
          if (not tmpAdo2.IsEmpty) then
          begin
            tmpAdo2.First;
            for i :=0  to DBGridEh1.Columns.Count-1 do
            begin
              if (DBGridEh1.Columns[i].FieldName=tmpAdo2.FieldByName('ColName').AsString) then
              begin
                iNo:=1;
                Break;
              end;
            end;
            if (iNo=1) then
            begin
              for i :=tmpAdo2.RecordCount  downto 1 do
              begin
                DBGridEh1.Columns.Delete(DBGridEh1.Columns.Count-tmpAdo.RecordCount-i);
              end;
            end;
          end;

          tmpAdo.Close;
          tmpAdo.SQL.Clear;
          tmpAdo.SQL.Add('select * from dbo.data0057 order by iSort');
          tmpAdo.Open;
          if (not tmpAdo.IsEmpty) then
          begin
            tmpAdo.First;
            for i :=0  to DBGridEh1.Columns.Count-1 do
            begin
              if (DBGridEh1.Columns[i].FieldName=tmpAdo.FieldByName('ColName').AsString) then
              begin
                iNo:=1;
                Break;
              end;
            end;
            if (iNo=1) then
            begin
              for i :=tmpAdo.RecordCount  downto 1 do
              begin
                DBGridEh1.Columns.Delete(DBGridEh1.Columns.Count-i);
              end;
            end;
          end;
          tmpAdo2.First;
          while not tmpAdo2.Eof do
          begin
            with DBGridEh1.Columns.Add do
            begin
              FieldName:=tmpAdo2.FieldBYName('ColName').AsString;
              Width:=60;
            end;
            tmpAdo2.Next;
          end;
          tmpAdo.First;
          while not tmpAdo.Eof do
          begin
            with DBGridEh1.Columns.Add do
            begin
              FieldName:=tmpAdo.FieldBYName('ColName').AsString;
              Width:=60;
            end;
            tmpAdo.Next;
          end;
        end;
        ADODataSet2.Close;
        ADODataSet2.CommandText:='exec Proc_ep060492_MX ''' +Sqlstr+FrmQuery.AddSQLTxt+' ''';
        ADODataSet2.Open;
        DBGridEh1.SumList.Active:=True;
        field_name := DBGridEh1.Columns[0].FieldName;
        PreColumn := DBGridEh1.Columns[0];
        DBGridEh1.Columns[0].Title.Color := clred ;
        Label1.Caption:=preColumn.Title.Caption;
      finally
        tmpAdo.Close;
        tmpAdo.Connection:=nil;
        tmpAdo.Free;
        tmpAdo2.Close;
        tmpAdo2.Connection:=nil;
        tmpAdo2.Free;
//        ADODataSet2.EnableControls;
      end;
    end;
    screen.Cursor:=crDefault;
  end;
  for i:=0 to DBGridEh1.FieldCount-1 do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible then
    item.Checked:=true;
    item.OnClick:=item_click;
    self.PopupMenu1.Items.Add(item);
  end;
end;

procedure TFrmOrderParameter.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption);
end;

procedure TFrmOrderParameter.FormActivate(Sender: TObject);
var i:integer;
    item:TMenuItem;
begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible then
    item.Checked:=true;
    item.OnClick:=item_click;
    self.PopupMenu1.Items.Add(item);
  end;
end;

procedure TFrmOrderParameter.FormShow(Sender: TObject);
begin
  Sqlstr:='';
  StartDate:=Date;EndDate:=Date;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  Label1.Caption:=preColumn.Title.Caption;
end;

procedure TFrmOrderParameter.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
//    Edit1.Enabled:=True;
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TFrmOrderParameter.BitBtn5Click(Sender: TObject);
begin
  PopupMenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrmOrderParameter.Edit1Change(Sender: TObject);
begin
  if (FrmQuery.RadioGroup2.ItemIndex=0) then
  begin
    if Trim(Edit1.Text)<>'' then
      ADODataSet1.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
    else
      ADODataSet1.Filter:='';
  end else
  if (FrmQuery.RadioGroup2.ItemIndex=1) then
  begin
    if Trim(Edit1.Text)<>'' then
      ADODataSet2.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit1.Text)+'%'''
    else
      ADODataSet2.Filter:='';
  end;
end;

procedure TFrmOrderParameter.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmOrderParameter.DBGridEh2TitleClick(Column: TColumnEh);
begin
  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])
      then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TFrmOrderParameter.Button2Click(Sender: TObject);
begin
  if (strtoint(vprev)<>4)  then
  begin
    messagedlg('对不起,您的权限不够',mtinformation,[mbok],0);
    Exit;
  end;
  frmD80_278:=TfrmD80_278.Create(application);
  frmD80_278.ShowModal;
  frmD80_278.Free;
end;

end.
