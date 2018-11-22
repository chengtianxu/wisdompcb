unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DB, ADODB,DateUtils,
  DBGridEh, ComCtrls;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtExcel: TBitBtn;
    BtQry: TBitBtn;
    BtFlds: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    PMFlds: TPopupMenu;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    DS1: TDataSource;
    PM: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    DS2: TDataSource;
    BtBack: TBitBtn;
    Grd2: TDBGridEh;
    N1: TMenuItem;
    N7: TMenuItem;
    BitBtn1: TBitBtn;
    PopRep: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure BtCloseClick(Sender: TObject);
    procedure BtExcelClick(Sender: TObject);
    procedure BtFldsClick(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure N2Click(Sender: TObject);
    procedure BtBackClick(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    Vdtpk3Time : tTime;
    Vdtpk4Time :tTime;
    FactGrd:TObject;
    procedure item_click(sender:TObject);
    procedure PrintData2(const value:integer;iTag:integer);
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation

USES
   common,DM_u,Frm_Enter_u ,Frm_back_u,Frm_Rep_u,IF_Unit2;

{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
 if not App_Init(dm.con1 ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;
  user_ptrCaption := user_ptr;
  vprevCaption := vprev;


//  user_ptrCaption := '785';
//  vprevCaption := '4';
//  dm.con1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  sSql := '' ;
  init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.BtExcelClick(Sender: TObject);
begin
  if Grd2.DataSource.DataSet.RecordCount > 0 then
      Export_dbGridEH_to_Excel(Grd2,'生产入仓') ;
end;

procedure TFrm_main.Grd1Enter(Sender: TObject);
begin
  FactGrd:=Sender;
end;

procedure TFrm_main.BtFldsClick(Sender: TObject);
begin
  PMFlds.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  i := -1 ;
  if Grd1.DataSource.DataSet.Active then
  begin
    if not Grd1.DataSource.DataSet.IsEmpty then
        i := Grd1.DataSource.DataSet.FieldValues['RKEY'] ;
    Grd1.DataSource.DataSet.Close ;
  end;
  Grd1.DataSource.DataSet.Open ;
  if i <> -1 then Grd1.DataSource.DataSet.Locate('RKEY',i,[]);
end;


procedure TFrm_main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := true;
      break;
    end;
  end else begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    Grd1.DataSource.DataSet.Filter := '';
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
      begin
        if Grd1.DataSource.DataSet.Filter <> '' then
            Grd1.DataSource.DataSet.Filter := Grd1.DataSource.DataSet.Filter + ' and ' +  field_name + ' like ''%' + trim(edit1.text) + '%'''
        else
            Grd1.DataSource.DataSet.Filter := field_name+' like ''%' + trim(edit1.text) + '%''' ;
      end else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
      begin
        if Grd1.DataSource.DataSet.Filter <> '' then
            Grd1.DataSource.DataSet.Filter := Grd1.DataSource.DataSet.Filter + ' and ' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))
        else
            Grd1.DataSource.DataSet.Filter := field_name + ' >= ' + inttostr(strtointdef(edit1.text,0)) ;
      end;
    end ;
  end;

end;

procedure TFrm_main.PrintData2(const value: integer;iTag:integer);
begin
   with TFrm_Rep.Create(nil)  do
   try
     ADOQ53.Close ;
     if iTag=1 then
        ADOQ53.SQL.Text:='SELECT Data0025.MANU_PART_NUMBER AS 本厂编号,'+
                        'Data0025.MANU_PART_DESC AS 客户型号,data0010.cust_code as 客户代码,'+
                        'sum(Data0053.QUANTITY) AS 数量 '+
                  'FROM Data0025 INNER JOIN '+
                        'Data0053 ON '+
                        'Data0025.RKEY = Data0053.CUST_PART_PTR LEFT OUTER JOIN '+
                        'Data0006 ON Data0053.WORK_ORDER_PTR = Data0006.RKEY '+
                        ' left join data0010 on Data0025.CUSTOMER_PTR=data0010.rkey '+
                  'WHERE Data0053.npad_ptr = :RKEY416 '+
                  'group by Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,data0010.cust_code '+
                  'order by Data0025.MANU_PART_NUMBER';

     ADOQ53.Parameters.ParamValues['RKEY416'] :=  value ;
     ADOQ53.Open ;

     ADOQ416.Close ;
     ADOQ416.Parameters.ParamValues['RKEY416'] :=  value ;
     ADOQ416.Open ;

     ADOQ493.Close ;
     ADOQ493.Open ;

     if iTag=0 then
     begin
       ppReport2.Reset;
       ppReport2.Template.FileName :=
         stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
         'REP0053.RTM';
       ppReport2.Template.LoadFromFile;
       ppReport2.SaveAsTemplate:=false;
       ppReport2.Print
     end
     else
     begin
       ppReport1.Reset;
       ppReport1.Template.FileName :=
         stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
         'REP00531.RTM';
       ppReport1.Template.LoadFromFile;
       ppReport1.SaveAsTemplate:=false;
       ppReport1.Print;
     end;
   finally
     Free ;
   end ;
end;

procedure TFrm_main.N3Click(Sender: TObject);
begin
  if not DM.ADOQ416.IsEmpty then
     PrintData2(DM.ADOQ416rkey.AsInteger,TComponent(Sender).Tag);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADOQ416.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADOQ416.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;

end;

procedure TFrm_main.init;
var
  i:byte;
  item:TMenuItem;
  VT2:TTIME;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  for i := 1 to Grd1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := Grd1.Columns[i - 1].Title.Caption;
    item.Checked :=Grd1.Columns[i - 1].Visible ;
    item.OnClick := item_click ;
    PMFlds.Items.Add(item) ;
  end;

  dm.qrytmp.Close;
  dm.qrytmp.SQL.Text:='select getdate(),Employee_name from data0005 where rkey='+user_ptrCaption;
  dm.qrytmp.Open;
  Vdtpk3Date := dm.qrytmp.fields[0].AsDateTime-2;
  Vdtpk4Date := dm.qrytmp.fields[0].AsDateTime+1;
  user_Nm:= dm.qrytmp.fields[1].AsString;

  sSql := dm.ADOQ416.SQL.Text ;
  VT2 := StrToTime('00:00:00') ;
  Vdtpk3Time := VT2 ;
  dm.ADOQ416.Parameters.ParamValues['vdate1'] := FormatDateTime('yyyy-MM-dd',Vdtpk3Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk3Time);
  VT2 := StrToTime('23:59:59') ;
  Vdtpk4Time := VT2 ;
  dm.ADOQ416.Parameters.ParamValues['vdate2'] := FormatDateTime('yyyy-MM-dd',Vdtpk4Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk4Time);
  dm.ADOQ416.Open ;
  DM.ADOQ416.Sort := field_name + ' ASC';
  FactGrd:=Grd1;
end;

procedure TFrm_main.N2Click(Sender: TObject);
begin
  if (vprevCaption = '1') or (vprevCaption = '3')  then
  begin
    showmessage('你只有检查权限，不能更改数数据！！');
    exit;
  end;
  dm.qrytmp.Close;
  dm.qrytmp.SQL.Text:='select rkey from data0214 where status=''0''';
  dm.qrytmp.Open;
  if not dm.qrytmp.IsEmpty then
  begin
    showmessage('当前正在盘点中,不能进行入库....');
    exit;
  end;
  with TFrm_Enter.Create(nil) do  //add
  try
   ShowModal ;
   BtBrushClick(Sender);
  finally
   Free ;
  end;
end;

procedure TFrm_main.BtBackClick(Sender: TObject);
var
  LFrm: TFrm_back;
begin
  if (vprevCaption = '1') or (vprevCaption = '3')  then
  begin
    showmessage('你只有检查权限，不能更改数数据！！');
    exit;
  end;
  LFrm := TFrm_back.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
begin
  If_Form2:= TIf_Form2.Create(application) ;
  try
     If_Form2.DateTimePicker1.Date := Vdtpk3Date ;
     If_Form2.DateTimePicker2.Date := Vdtpk4Date ;
     If_Form2.DateTimePicker3.Time := Vdtpk3Time ;
     If_Form2.DateTimePicker4.Time := Vdtpk4Time ;
     if If_Form2.ShowModal = mrok then
    begin
      Vdtpk3Date := If_Form2.DateTimePicker1.Date ;
      Vdtpk4Date := If_Form2.DateTimePicker2.Date ;
      Vdtpk3Time := If_Form2.DateTimePicker3.Time ;
      Vdtpk4Time := If_Form2.DateTimePicker4.Time ;
      dm.ADOQ416.Close ;
      dm.ADOQ416.SQL.clear;
      dm.ADOQ416.SQL.Add(sSql);
      for i := 1 to If_Form2.sgrid1.RowCount - 2  do
         dm.ADOQ416.SQL.Add(trim(If_Form2.sgrid1.Cells[2,i]));
      dm.ADOQ416.Parameters.ParamValues['vdate1'] := FormatDateTime('yyyy-MM-dd',Vdtpk3Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk3Time);
      Dm.ADOQ416.Parameters.ParamValues['vdate2'] := FormatDateTime('yyyy-MM-dd',Vdtpk4Date) + ' ' + FormatDateTime('HH:MM:SS',Vdtpk4Time);
      dm.ADOQ416.Open ;
    end ;
  finally
     If_Form2.Free ;
  end;
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
   PopRep.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.N8Click(Sender: TObject);
begin
  if (vprevCaption = '1') or (vprevCaption = '3') or (vprevCaption = '2') then
  begin
    showmessage('你只有检查权限，不能更改数数据！！');
    exit;
  end;
  with TFrm_Rep.Create(nil) do
  try
   ADOQ53.Close ;
   ADOQ53.Parameters.ParamValues['RKEY416']:=DM.ADOQ416rkey.Value ;
   ADOQ53.Open ;

   ADOQ416.Close ;
   ADOQ416.Parameters.ParamValues['RKEY416']:=DM.ADOQ416rkey.Value ;
   ADOQ416.Open ;

   ADOQ493.Close ;
   ADOQ493.Open ;

   if Tcomponent(Sender).Tag=0 then
   begin
     ppReport2.Reset;
     ppReport2.Template.FileName :=
       stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
       'REP0053.RTM';
     ppReport2.Template.LoadFromFile;
     ppReport2.SaveAsTemplate:=false;
     ppDesigner2.ShowModal;
   end
   else
   begin
     ppReport1.Reset;
     ppReport1.Template.FileName :=
       stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
       'REP00531.RTM';
     ppReport1.Template.LoadFromFile;
     ppReport1.SaveAsTemplate:=false;
     ppDesigner1.ShowModal ;
   end;
  finally
   Free ;
  end ;
end;

end.
