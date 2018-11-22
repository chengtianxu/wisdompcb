unit SheetListFrm;

interface

uses
  Windows, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus;

type
  TfrmSheetList = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lvSheetList: TListView;
    btnOK: TButton;
    btnCancel: TButton;
    lbl1: TLabel;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    btnAdd: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmSheetList: TfrmSheetList;

implementation

uses
  IniFiles, SheetAddFrm;

{$R *.dfm}

procedure TfrmSheetList.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmSheetList.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSheetList.mniN1Click(Sender: TObject);
begin
  frmAddSheet := TfrmAddSheet.Create(Self);
  try
    if frmAddSheet.ShowModal = mrOk then
    begin
      with lvSheetList.Items.Add do
      begin
        Caption := '';
        SubItems.Add(frmAddSheet.edtW.Text);
        SubItems.Add('X');
        SubItems.Add(frmAddSheet.edtH.Text);
        Checked := True;
      end;
    end;
  finally
    frmAddSheet.Free;
  end;
end;

end.
