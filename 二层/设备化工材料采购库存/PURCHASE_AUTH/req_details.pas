unit req_details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, Menus;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    Label9: TLabel;
    DBText13: TDBText;
    DBText14: TDBText;
    Label10: TLabel;
    DBText15: TDBText;
    Label11: TLabel;
    DBText16: TDBText;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    Label12: TLabel;
    DBText17: TDBText;
    DBText18: TDBText;
    Label13: TLabel;
    Label6: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button2: TButton;
    Button3: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses damo, note, stdhistory_price, michistory_price, supplier_info;
{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption := '采购请求记事本:'+dbtext1.Caption;
  edit_note.Button1.Visible := false;
  edit_note.Button2.Visible := false;
  edit_note.Button3.Visible := true;
  edit_note.Memo1.ReadOnly := true;
  edit_note.Memo1.Color := cl3dlight;
  edit_note.BitBtn1.Enabled := false;
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=68 and');
    sql.Add('file_pointer='+dm.AQ0068rkey.AsString);
    active:=true;
    if not isempty then
     for i:=1 to 4 do
      edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
 edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=27 then  self.ModalResult:=mrok;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
form_stdprice := tform_stdprice.Create(application);
form_stdprice.ShowModal;
form_stdprice.Free;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
 form_micprice := tform_micprice.Create(application);
 form_micprice.ShowModal;
 form_micprice.Free;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
form4:=tform4.Create(application);
form4.ShowModal;
form4.Free;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
if dm.AQ0068v_status.Value = '批准' then
 button2.Enabled:=false;
end;

end.
