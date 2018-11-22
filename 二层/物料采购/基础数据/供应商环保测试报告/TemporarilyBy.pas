unit TemporarilyBy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, base_unt, StdCtrls, Mask, DBCtrlsEh, ComCtrls;

type
  TTemporarilyBy_f = class(TBase_frm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TemporarilyBy_f: TTemporarilyBy_f;

implementation

uses PublicFile;

{$R *.dfm}

procedure TTemporarilyBy_f.FormShow(Sender: TObject);
begin
  inherited;

  Self.DateTimePicker1.Date:=IncMonth(Curr_Date)  ;
end;                                //  GetDataBaseDate(DM.dtRead,ASmallDateTime)

end.
