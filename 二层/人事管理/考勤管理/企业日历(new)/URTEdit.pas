unit URTEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,common, DB, ADODB, StdCtrls, ComCtrls;

type
  TfrmRTEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btn_Save: TButton;
    btn_cancel: TButton;
    qrytemp: TADOQuery;
    qryFC: TADOQuery;
    edt_HType: TEdit;
    edt_Color: TEdit;
    edt_remark: TEdit;
    procedure btn_cancelClick(Sender: TObject);
  private
    { Private declarations }
  public
     FEType: Integer;
     FHkey:integer;
  end;

var
  frmRTEdit: TfrmRTEdit;

implementation
     uses udm;
{$R *.dfm}

procedure TfrmRTEdit.btn_cancelClick(Sender: TObject);
begin
close;
end;

end.
