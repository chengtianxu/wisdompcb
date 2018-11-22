unit Detailed1_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, ADODB, StdCtrls, Buttons, ToolWin, ComCtrls,
  ExtCtrls,StrUtils;

type
  TDetailed1_frm = class(TForm)
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    ADOQuery1CUT_NO: TStringField;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1PRODUCT_DESC: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1UNIT_CODE: TStringField;
    ADOQuery1alloc_datetime: TDateTimeField;
    ADOQuery1quan_alloc: TBCDField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BtQry: TBitBtn;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ADOQuery1d492_ptr: TIntegerField;
    ADOQuery1rkey22: TIntegerField;
    ADOQuery2: TADOQuery;
    ADOQuery1part_name: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure ADOQuery1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Filter_FieldName     :string;
    Filter_Panel         :TPanel;
    Filter_Label         :TLabel;
    Filter_edit          :TEdit;
    Filter_Start_DateTime:TDateTimePicker;
    Filter_End_DateTime  :TDateTimePicker;
    procedure Filter_Create(ParentPanel:TPanel);
    procedure Filter_Set(ACol:TColumnEh);  //如果要使用这一功能，需要将这一方法放入DghMainTitleClick事件中
    procedure Filter_edit_Change(Sender: TObject);
    procedure Filter_DateTimePicker_KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Detailed1_frm: TDetailed1_frm;

implementation

uses DAMO, main;

{$R *.dfm}
procedure TDetailed1_frm.Filter_DateTimePicker_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then   //  , VK_down
  begin
    with ADOQuery1 do
    begin
      Filtered:=False ;
      if (VarIsNull(Filter_Start_DateTime.DateTime )=False)and(VarIsNull(Filter_End_DateTime.DateTime )=False) then
      begin
        Filter:=Filter_FieldName+' >= '+QuotedStr(DateToStr(Filter_Start_DateTime.Date))+
        ' and '+Filter_FieldName+' <= '+QuotedStr(DateToStr(Filter_End_DateTime.  Date));
       // ShowMessage(Filter);
        Filtered:=True ;
      end;
    end;
  end;
end;

procedure TDetailed1_frm.Filter_edit_Change(Sender: TObject);
begin
  with ADOQuery1 do
  if trim(Filter_edit.Text) <> '' then
  begin
    Filtered := False;
   // Filter   := 'Filter_FieldName = %'+trim(Filter_edit.Text)+'%';
    Filtered := true;
  end
  else
    Filtered := False;
end;

procedure TDetailed1_frm.Filter_Set(ACol:TColumnEh);
begin
  with ACol do
  begin
    if GetKeyState(vk_Shift)>=0 then
    if UpperCase(ACol.FieldName)<> UpperCase(Filter_FieldName) then
    begin
      if Field.DataType in[ftString,ftWideString] then
      begin
        Filter_FieldName:= ACol.FieldName;
        Filter_Label.Caption:=  ACol.Title.Caption;
        if Assigned (Filter_Start_DateTime) then
        begin
          Filter_Start_DateTime.Free;
          Filter_Start_DateTime:=nil;
          Filter_End_DateTime.Free;
          Filter_End_DateTime:=nil;
          ADOQuery1.Filter:='';
          ADOQuery1.Filtered:=False;
        end;

        if Assigned (Filter_edit)=False  then
        begin
          Filter_edit:=TEdit.Create(Application);
          Filter_edit.Parent:=Filter_Panel;
          Filter_edit.Top:=3;
          Filter_edit.OnChange:=Filter_edit_Change;
        end;
        Filter_edit.Text:='';
        Filter_edit.Left:= Filter_Label.Left+Filter_Label.Width+5;
        
        Filter_edit.Width:=ACol.Width;
        if  Filter_edit.Width<121 then
        Filter_edit.Width:=121  ;
        Filter_edit.Left:= Filter_Label.Left+Filter_Label.Width+5;
       // Filter_Label.Top:=9;
        Filter_Panel.Width:= Filter_Label.Width+Filter_edit.Width+300;
      end
      else
      if Field.DataType in[ftDatetime] then
      begin
        Filter_FieldName:= ACol.FieldName;
        Filter_Label.Caption:=  ACol.Title.Caption;
        if Assigned (Filter_edit) then
        begin
          Filter_edit.Text:='';
          Filter_edit.Free;
          Filter_edit:=nil;
        end;
        if Assigned (Filter_Start_DateTime)=False  then
        begin
          Filter_Start_DateTime:=TDateTimePicker.Create(Application);
          Filter_Start_DateTime.Parent:=Filter_Panel;
          Filter_Start_DateTime.Top:=3;
          Filter_Start_DateTime.OnKeyDown:=Filter_DateTimePicker_KeyDown;
          Filter_Start_DateTime.ShowHint := True;
          Filter_Start_DateTime.Hint := '击回车键进行过滤';

          Filter_End_DateTime:=TDateTimePicker.Create(Application);
          Filter_End_DateTime.DateTime:= Curr_Date+1;
          Filter_End_DateTime.Parent:=Filter_Panel;
          Filter_End_DateTime.Top:=3;
          Filter_End_DateTime.OnKeyDown:=Filter_DateTimePicker_KeyDown;
          Filter_End_DateTime.ShowHint := True;
          Filter_End_DateTime.Hint := '击回车键进行过滤';
        end;
        Filter_Start_DateTime.Width:=90;//ACol.Width+20;
        Filter_End_DateTime.Width:=90;//ACol.Width+20;
        Filter_Start_DateTime.Left:= Filter_Label.Left+Filter_Label.Width+5;
        Filter_End_DateTime.Left:= Filter_Start_DateTime.Left+Filter_Start_DateTime.Width+5;

       // Filter_Label.Top:=9;
        Filter_Panel.Width:= Filter_Label.Width+Filter_Start_DateTime.Width+Filter_End_DateTime.Width+20;  //  15
      end;
    end;
  end;
  //Filter_Panel.Width:= Filter_Label.Width+Filter_edit.Width+15;
end;

procedure TDetailed1_frm.Filter_Create(ParentPanel:TPanel);
begin
  Filter_Panel:=TPanel.Create(Application);
  Filter_Panel.Parent:= ParentPanel;
  Filter_Panel.Caption:='';
  Filter_Panel.Align:=alLeft;
  Filter_Panel.BevelOuter:=bvNone;
  
  Filter_Label:=TLabel.Create(Application);
  Filter_Label.Parent:=  Filter_Panel;
  Filter_Label.Left:=5;
  Filter_Label.Top:=7; 
end;

procedure TDetailed1_frm.BitBtn1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TDetailed1_frm.BitBtn3Click(Sender: TObject);
var
  t1,t2:Integer;
begin
  with  ADOQuery1 do
  begin
    t1 := FieldByName('d492_ptr').AsInteger;
    t2 := FieldByName('rkey22').AsInteger;
    Close;
    Open;
    if IsEmpty = False then
    Locate('d492_ptr;rkey22',VarArrayOf([t1,t2]),[]);
  end;
end;

procedure TDetailed1_frm.BitBtn4Click(Sender: TObject);
begin
  if not ADOQuery1.IsEmpty then
//Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
  MAIN_Form.OutputExcelStd(Self,DBGridEh1);
end;

procedure TDetailed1_frm.ADOQuery1AfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
end;

procedure TDetailed1_frm.FormShow(Sender: TObject);
begin
  Filter_Create(Panel1);
  Filter_Set(DBGridEh1.FieldColumns['INV_PART_NUMBER']);
end;

procedure TDetailed1_frm.DBGridEh1TitleClick(Column: TColumnEh);
begin
  Filter_Set( Column);

  with Column.Grid.DataSource.DataSet as TCustomADODataSet do
  begin
    if FieldByName(Column.FieldName).FieldKind in[ fkCalculated,fkLookup]  then
      exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      Sort:=Column.FieldName+' DESC';
    end;
  end;
end;

procedure TDetailed1_frm.ADOQuery1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Assigned(Filter_edit) then
  if Trim(Filter_edit.Text) <>'' then
    Accept:=AnsiContainsText(
    UpperCase(DataSet.FieldByName(Filter_FieldName).AsString),
    UpperCase(Filter_edit.Text )
    ) ;
end;

procedure TDetailed1_frm.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADOQuery1.SQL.Text);
end;

end.
