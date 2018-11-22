unit returen_so;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Menus;

type
  TForm10 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses damo, detail;

{$R *.dfm}

procedure TForm10.RadioGroup1Click(Sender: TObject);
begin

 label1.Caption :=
 radiogroup1.Items.Strings[radiogroup1.ItemIndex];
edit1.SetFocus;
end;

procedure TForm10.BitBtn2Click(Sender: TObject);
begin
 edit1.Text := '';
 edit1.SetFocus;
end;

procedure TForm10.Edit1Change(Sender: TObject);
begin
 IF trim(EDIT1.TEXT) <> '' THEN
  if radiogroup1.ItemIndex = 0 then
   dm.ADOQuery1.Filter := 'sales_order like ''%'+Trim(Edit1.Text)+'%'''
  else
   dm.ADOQuery1.Filter := 'MANU_PART_DESC like ''%'+trim(edit1.text)+'%'''
 ELSE
  dm.ADOQuery1.FILTER := '';
if dm.ADOQuery1.IsEmpty then
 button1.Enabled := false
else
 button1.Enabled := true;
end;

procedure TForm10.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ADOQuery1.IsEmpty then n1click(sender);
end;

procedure TForm10.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not dm.ADOQuery1.IsEmpty) then  modalresult:=mrok;
end;

procedure TForm10.N1Click(Sender: TObject);
begin
 try
  form8:=tform8.Create(application);
  dm.ADOQuery3.Active:=false;
  dm.ADOQuery3.Parameters[1].Value:= dm.ADOQuery1.FieldValues['rkey'];
  dm.ADOQuery3.Active:=true;
  dm.ado89.Open;
  with dm.ADOQuery4 do
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011 where SOURCE_TYPE=1060 and');
    sql.Add('FILE_POINTER='+dm.ADOQuery1.fieldbyname('rkey').AsString);//+dm.ADOQuery1.fieldbyname('PURCHASE_ORDER_PTR').AsString);
    open;
    if not isempty then form8.Memo1.Text:=fieldvalues['memo_text'];
   end;
  form8.ShowModal;
  dm.ADOQuery3.Close;
  dm.ado89.Close;
 finally
  form8.free;
 end;
end;

procedure TForm10.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADOQuery1.IsEmpty then
 n1.Enabled := false
else
 n1.Enabled := true; 
end;

procedure TForm10.FormActivate(Sender: TObject);
begin
if dm.ADOQuery1.Filter<>'' then
 dm.ADOQuery1.Filter:='';
end;


procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if dm.ADOQuery1.Filter<>'' then
 dm.ADOQuery1.Filter:='';
end;

end.
