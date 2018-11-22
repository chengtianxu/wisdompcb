unit form_AuthInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, base_unt,  StdCtrls, DB, DBGridEh, DBClient,
  Provider, ADODB, Grids;
         
type
  Tfrm_AuthInfo = class(TBase_frm)
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    Button1: TButton;
    dtRead: TADODataSet;
    dspRead: TDataSetProvider;
    cdsRead: TClientDataSet;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_AuthInfo: Tfrm_AuthInfo;

implementation

uses DM_unt;

{$R *.dfm}

procedure Tfrm_AuthInfo.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure Tfrm_AuthInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  inherited;

end;

end.
