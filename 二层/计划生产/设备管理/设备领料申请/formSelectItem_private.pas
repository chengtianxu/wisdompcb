unit formSelectItem_private;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, ExtCtrls, DB,StrUtils,
  Buttons, Grids, DBGrids, ADODB, DBClient, Menus;

type
  TfrmSelectItem_private = class(TForm)
    pnl2: TPanel;
    pnl1: TPanel;
    Edit1: TEdit;
    ds1: TDataSource;
    bt1: TSpeedButton;
    dgh1: TDBGrid;
    Button1: TButton;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Dgh1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt1Click(Sender: TObject);
    procedure dgh1CellClick(Column: TColumn);
    procedure dgh1TitleClick(Column: TColumn);
    procedure N1Click(Sender: TObject);
    procedure dgh1KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    procedure cdsFilterRecord(DataSet: TDataSet;
         var Accept: Boolean);
 //   VResultFieldName:string;
    { Private declarations }
  public
    FilterFieldName:string;
    { Public declarations }
  end;

var
  frmSelectItem_private: TfrmSelectItem_private;

Function ShowfrmSelectItem_private(SelfForm:TForm; ADODataSet: TDataSet;AFilterField:string;
    FilterFieldValue:string; L,T,W:Integer;FormCaption:PChar=nil;GridNotDisplayFields:TStrings=nil):Boolean; StdCall;

implementation

uses form_Picking;

//uses DBEditBit;

//uses AddListUnit;


{$R *.dfm}
Function ShowfrmSelectItem_private(SelfForm:TForm; ADODataSet: TDataSet;AFilterField:string;
    FilterFieldValue:string; L,T,W:Integer;FormCaption:PChar=nil;GridNotDisplayFields:TStrings=nil):Boolean; StdCall;
var
  s:string;
  I_S,I_F:Integer;
  colt:TColumn;
begin
  Result:=False;
  try
    frmSelectItem_private:=TfrmSelectItem_private.Create(SelfForm);
    frmSelectItem_private.Font.Size    := SelfForm.Font.Size;
    frmSelectItem_private.Font.Charset := SelfForm.Font.Charset;
    frmSelectItem_private.Font.Name    := SelfForm.Font.Name;

    with frmSelectItem_private do
    begin
      if  FormCaption='' then
        Caption:='选择'
      else
        Caption:=FormCaption;

      ds1.DataSet:=ADODataSet;

      with frm_Picking.cds0015 do
      begin
        First;
        while  not Eof do
        begin
          ComboBox1.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
          //ComboBox1.Items.Add(FieldByName('ABBR_NAME').AsString);
          Next;
        end;
        if frm_Picking.cdsMain.FieldByName('fac_name').IsNull =False then
        ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf( frm_Picking.cdsMain.FieldByName('fac_name').Value);
      end;
      if ds1.DataSet.Active =False then
        ds1.DataSet.Open;   {  }

      if GridNotDisplayFields<>nil then
      begin
        for I_S:=0 to GridNotDisplayFields.Count-1 do
        begin
          for I_F:=0 to dgh1.FieldCount-1 do
          begin
            if (dgh1.Columns[I_F].FieldName=GridNotDisplayFields[I_S]) then
            begin
              dgh1.Columns[I_F].Visible:=False;
              Break    ;
            end;
          end;
        end;
      end;
     { for i:=0 to  FieldList.Count-1 do
      begin
        colt:=dgh1.Columns.Add;
        colt.FieldName:= FieldList[i];
      end; }
      FilterFieldName:= AFilterField;
      ADODataSet.OnFilterRecord:= cdsFilterRecord;
      Edit1.Text:= FilterFieldValue;

      frmSelectItem_private.Left:=L;
      frmSelectItem_private.Top:=T;
      frmSelectItem_private.Width:=w;
     // frmSelectItem.Height:= w / 4 * 3);
      if frmSelectItem_private.ShowModal=mrOk then
      Result:=True;
    end;
  finally
    frmSelectItem_private.Free;
  end;
end;

procedure TfrmSelectItem_private.cdsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  strTemp: String;
begin
//  if Trim(Edit1.Text) <>'' then
//  Accept:=(AnsiContainsText(DataSet.FieldByName(FilterFieldName).AsString,Edit1.Text )) ;
  if Trim(Edit1.Text) <>'' then
  if CheckBox2.Checked then
    Accept:= UpperCase(Trim(DataSet.FieldByName(FilterFieldName).AsString))=UpperCase(Trim(Edit1.Text) )
  else     //字符串比较不区分大小写
    Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(Edit1.Text )) ;
end;

procedure TfrmSelectItem_private.FormShow(Sender: TObject);
var
  i:Integer;
begin


  if dgh1.DataSource.DataSet is TClientDataSet then
  begin
    with  dgh1.DataSource.DataSet as TClientDataSet do
    if ReadOnly=False then
    begin

      dgh1.PopupMenu:= PopupMenu1;
    end
    else
      dgh1.PopupMenu:= nil;
  end
  else
  if dgh1.DataSource.DataSet is TADODataSet then
  begin
    with  dgh1.DataSource.DataSet as TADODataSet do
    if LockType=ltReadOnly then
    begin
      dgh1.PopupMenu:= PopupMenu1;
    end
    else
      dgh1.PopupMenu:= nil;
  end;

  for I := 0 to Dgh1.FieldCount - 1 do
  begin
    if UpperCase(Dgh1.Fields[i].FieldName)=UpperCase(FilterFieldName) then
    begin
      Dgh1.SelectedIndex:=i;
      Dgh1TitleClick(Dgh1.Columns[i]);
      Exit;
    end;
  end;

  Dgh1.SetFocus;
  Edit1.SetFocus;
//  Edit1.SetFocus;
//  FilterFieldName:= Dgh1.DataSource.DataSet.FieldList[0].FieldName;
//  Label1.Caption:=  Dgh1.DataSource.DataSet.FieldList[0].DisplayLabel;
//  Label1.Left:=5;
//  Edit1.Left:=10+label1.Width;
//  bt1.Left:=Edit1.Left+edit1.Width+5;
end;

procedure TfrmSelectItem_private.N1Click(Sender: TObject);
begin
  dgh1.DataSource.DataSet.Delete;
end;

procedure TfrmSelectItem_private.Edit1Change(Sender: TObject);
var
  strsql: string;
begin
  with (Dgh1.DataSource.DataSet as TDataSet) do
  if trim(Edit1.Text) <> '' then
  begin
    Filtered := False;
    Filtered := true;
  end
  else
    Filtered := False;
//  strsql := '';
//  if trim(Edit1.Text) <> '' then
//  begin
//    if dgh1.DataSource.DataSet.FieldByName(FilterFieldName).DataType in [ftDate,ftDateTime] then
//      strsql :=  FilterFieldName+' = ' + QuotedStr(trim(Edit1.Text))
//    else
//      strsql :=  FilterFieldName+' like ''%' + trim(Edit1.Text) + '%''';
//  end   ;
//
//  if strsql <> '' then
//  begin
//   // ShowMessage(strsql);
//    Dgh1.DataSource.DataSet.Filter := strsql;
//    Dgh1.DataSource.DataSet.Filtered := true;
//  end
//  else
//  begin
//    Dgh1.DataSource.DataSet.Filter := '';
//    Dgh1.DataSource.DataSet.Filtered := false;
//  end;
end;

procedure TfrmSelectItem_private.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Dgh1DblClick(Sender);
end;

procedure TfrmSelectItem_private.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
    BM:Pointer ;
begin

  if dgh1.DataSource.DataSet is TClientDataSet then
  begin
    with dgh1.DataSource.DataSet as TClientDataSet  do
    begin
      if State in [dsInsert,dsEdit] then
      Post;
      if ChangeCount>0   then
      if ApplyUpdates(0)=0 then
      begin
        try
          bm:=GetBookmark;//书签。
          Refresh;
          GotoBookmark(BM);  // 重新定位到书签
        finally
          FreeBookmark(bm ) ;
        end;
      end;
    end;
  end
  else
  if dgh1.DataSource.DataSet is TCustomADODataSet then
  begin
    with dgh1.DataSource.DataSet as TCustomADODataSet  do
    begin
      if State in [dsInsert,dsEdit] then
      Post;
    end;
  end;
end;

procedure TfrmSelectItem_private.Dgh1DblClick(Sender: TObject);
begin
  Button1.Click;
end;

procedure TfrmSelectItem_private.FormCreate(Sender: TObject);
begin;

end;

procedure TfrmSelectItem_private.bt1Click(Sender: TObject);
begin
  self.Edit1.Text:='';
  if Dgh1.DataSource.DataSet.Filtered then
  Dgh1.DataSource.DataSet.Filtered :=False;
end;

procedure TfrmSelectItem_private.dgh1CellClick(Column: TColumn);
begin
//  FilterFieldName:=dgh1.SelectedField.FieldName;
//  Label1.Caption:=  Dgh1.DataSource.DataSet.FieldByName(FilterFieldName).DisplayLabel;
//  Label1.Left:=5;
//  Edit1.Left:=10+label1.Width;
//  bt1.Left:=Edit1.Left+edit1.Width+5;
end;

procedure TfrmSelectItem_private.dgh1TitleClick(Column: TColumn);
begin
   Label1.Caption:=Column.Field.DisplayLabel;
   Label1.Left:=5;
   Edit1.Left:=10+ Label1.Width;
   bt1.Left:= Edit1.Left+ Edit1.Width+5;
   CheckBox2.Left:=bt1.Left+bt1.Width+10;
   if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
   begin
     Edit1.Text:='';
     FilterFieldName:= Column.Field.FieldName;
   end;
end;

procedure TfrmSelectItem_private.dgh1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Button1.Click;
end;

procedure TfrmSelectItem_private.CheckBox2Click(Sender: TObject);
begin
  Edit1Change(nil);
end;

procedure TfrmSelectItem_private.ComboBox1Change(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    with frm_Picking do
    if  cds0017WM.Params.ParamByName('vWarehouse_ptr').AsInteger<>Integer(combobox1.Items.Objects[combobox1.ItemIndex]) then
    begin
      cds0017WM.Close;
      cds0017WM.Params.ParamByName('vWarehouse_ptr').AsInteger:=Integer(combobox1.Items.Objects[combobox1.ItemIndex]);
      cds0017WM.Open;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

end.
