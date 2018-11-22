unit formSelectMultiItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, Buttons, ExtCtrls, DB, DBClient,StrUtils,
  ADODB, Provider;

type
  TfrmSelectMultiItem = class(TForm)
    Panel1: TPanel;
    bt1: TSpeedButton;
    FieldLabel: TLabel;
    Edit1: TEdit;
    Dgh1: TDBGridEh;
    pnl1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    CheckBox1: TCheckBox;
    ds1: TDataSource;
    CheckBox2: TCheckBox;
    procedure bt1Click(Sender: TObject);
    procedure Dgh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure Dgh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Dgh1TitleClick(Column: TColumnEh);
    procedure btnOKClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure cdsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
    { Private declarations }
  public
     FilterFieldName:string;
    { Public declarations }
  end;

Function ShowfrmSelectMultiItem(SelfForm:TForm; ADataSet: TDataSet;AFilterFieldName:string;
       L:Integer=0;T:Integer=0;W:Integer=0;FormCaption:PChar=nil):Boolean; StdCall;
var
  frmSelectMultiItem: TfrmSelectMultiItem;

implementation

uses DM_f;  // , PP_Qty_u

{$R *.dfm}

Function ShowfrmSelectMultiItem(SelfForm:TForm; ADataSet: TDataSet;AFilterFieldName:string;
       L:Integer=0;T:Integer=0;W:Integer=0;FormCaption:PChar=nil):Boolean; StdCall;
//var
//  s:string;
//  i:Integer;
//  colt:TColumn;
begin
  Result:=False;
 // Application.Handle:=AHandle;
  try
//    if Assigned (frmSelectMultiItem)=False then
    frmSelectMultiItem:=TfrmSelectMultiItem.Create(SelfForm);
    frmSelectMultiItem.Font.Size:= SelfForm.Font.Size;
    frmSelectMultiItem.Font.Charset:=SelfForm.Font.Charset;
    frmSelectMultiItem.Font.Name:= SelfForm.Font.Name;
    with frmSelectMultiItem do
    begin
 //     vResultFieldName:=ResultFieldName;
      if  FormCaption='' then
        Caption:='选择'
      else
        Caption:=FormCaption;

      ds1.DataSet:=ADataSet;
      if ds1.DataSet.Active =False then
        ds1.DataSet.Open;   {  }

      if L>0 then
      begin
        frmSelectMultiItem.Left:=L;
        frmSelectMultiItem.Top:=T;
        
      end
      else
        frmSelectMultiItem.Position:= poMainFormCenter;
      if w>0 then
        frmSelectMultiItem.Width:=w;

      Dgh1TitleClick(Dgh1.FieldColumns[AFilterFieldName]);
      ADataSet.OnFilterRecord:= cdsFilterRecord;
      if frmSelectMultiItem.ShowModal=mrOk then
      begin
        ADataSet.Filtered:=False;
        Result:=True;
      end;
      
    end;
  finally
    frmSelectMultiItem.Free;
  end;
end;

procedure TfrmSelectMultiItem.bt1Click(Sender: TObject);
begin
  Edit1.Clear;
  if Dgh1.DataSource.DataSet.Filtered then
  Dgh1.DataSource.DataSet.Filtered:=False;
end;

procedure TfrmSelectMultiItem.Dgh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TfrmSelectMultiItem.Dgh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText);
  end;

  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;

  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end;
end;

procedure TfrmSelectMultiItem.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelectMultiItem.cdsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
//var
//  strTemp: String;
begin
  if Trim(Edit1.Text) <>'' then
  begin
    if CheckBox2.Checked then
      Accept:= UpperCase(Trim(DataSet.FieldByName(FilterFieldName).AsString))=UpperCase(Trim(Edit1.Text) )
    else     //字符串比较不区分大小写
      Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName(FilterFieldName).AsString),UpperCase(Edit1.Text )) ;
   // Accept:=(Pos(UpperCase(Edit1.Text), UpperCase(DataSet.FieldByName(FilterFieldName).AsString))>0) ;
  end;
end;

procedure TfrmSelectMultiItem.Edit1Change(Sender: TObject);
//var
//  strsql: string;
begin
  with Dgh1.DataSource.DataSet as TClientDataSet  do
  begin
//    if (state=dsEdit)or( ChangeCount>0) then
//    begin
//      Cancel;              // 过滤条件改变的时候，原选择的记录取消。
//      CancelUpdates;
//    end;
    if CheckBox1.Checked then
    begin
      CheckBox1.Checked:=False;
      CheckBox1.OnClick(CheckBox1);
    end;

    if trim(Edit1.Text) <> '' then
    begin
      Filtered := False;
      Filtered := true;
    end
    else
      Filtered := False;
  end ;
end;

procedure TfrmSelectMultiItem.CheckBox1Click(Sender: TObject);
var
  BM:Pointer;//TBookmark;
begin
  with Dgh1.DataSource.DataSet as TClientDataSet do
  begin
    bm:=GetBookmark;//书签。
    try
      DisableControls;
      Screen.Cursor := crHourGlass;
      First;
      if (Sender as  TCheckBox).Checked then
      begin
        while not Eof do
        begin
          Edit;
          FieldByName('selected').Value:=True ;
          Next;
        end;
      end
      else
      begin
        Cancel;
        CancelUpdates;
          //  FieldByName('selected').Value:=False;
      end;
      GotoBookmark(BM);  // 重新定位到书签
    finally
      FreeBookmark(bm ); //释放书签。
      EnableControls ;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmSelectMultiItem.Dgh1TitleClick(Column: TColumnEh);
begin
  FieldLabel.Caption:=Column.Field.DisplayLabel;
  FieldLabel.Left:=5;
  Edit1.Left:=10+ FieldLabel.Width;
  bt1.Left:= Edit1.Left+ Edit1.Width+5;
  CheckBox2.Left:=bt1.Left+bt1.Width+10;
  if UpperCase(Column.Field.FieldName)<>UpperCase(FilterFieldName) then
  begin
    Edit1.Text:='';
    FilterFieldName:= Column.Field.FieldName;
  end;
end;

procedure TfrmSelectMultiItem.btnOKClick(Sender: TObject);
begin
  if  ds1.DataSet.State in [dsEdit] then
    ds1.DataSet.Post;
  ModalResult:=mrOk;        
end;

procedure TfrmSelectMultiItem.CheckBox2Click(Sender: TObject);
begin
  Edit1Change(nil);
end;

procedure TfrmSelectMultiItem.FormShow(Sender: TObject);
begin
  with Dgh1.DataSource.DataSet as TClientDataSet do
  begin
    if Filtered then
    Filtered :=False;
    Cancel;
    CancelUpdates;
  end;
  if Trim(Edit1.Text)<>'' then
    Edit1.Text:='';
  if CheckBox1.Checked then
    CheckBox1.Checked:=False;
  if CheckBox2.Checked then
    CheckBox2.Checked:=False;
             
  btnOK.Left:=round( (Self.Width- btnOK.Width-btnCancel.Width-50)/ 2);
  btnCancel .Left:= btnOK.Left+btnOK.Width+50;
  //round取整函数,在Delphi中使用Round函数得到的答案有时与我们所预期的会不太一样：采用的是四舍六入五留双
end;

procedure TfrmSelectMultiItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //(ds1.DataSet as TClientDataSet).CancelUpdates;
end;

end.
