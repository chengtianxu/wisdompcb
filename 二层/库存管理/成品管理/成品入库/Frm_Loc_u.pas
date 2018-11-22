unit Frm_Loc_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrm_Loc = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    Splitter1: TSplitter;
    Label2: TLabel;
    EdtLoc: TEdit;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1CODE: TStringField;
    ADOQuery1LOCATION: TStringField;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ADOQuery1relationOrder: TBooleanField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FaID:integer;
    { Public declarations }
  end;

var
  Frm_Loc: TFrm_Loc;

implementation

uses DM_u;


{$R *.dfm}

procedure TFrm_Loc.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult:=mrok;
end;

procedure TFrm_Loc.BitBtn1Click(Sender: TObject);
begin
  edit1.Text := '';
  edit1.SetFocus;
end;

procedure TFrm_Loc.Edit1Change(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    Adoquery1.Filter := 'CODE like '''+trim(edit1.Text)+'%'''
  else
    Adoquery1.Filter := '';
  BitBtn3.Enabled:=Adoquery1.RecordCount>0;
end;

procedure TFrm_Loc.FormShow(Sender: TObject);
begin
  if FAID<>0 then
    Adoquery1.SQL.Text:='SELECT RKEY,CODE,LOCATION,relationOrder'+
    ' FROM Data0016 where allow_putout = 1 and location_type=1 and whouse_ptr='+inttostr(FAID)+' ORDER BY CODE';

  Adoquery1.Open ;
  BitBtn3.Enabled:=Adoquery1.RecordCount>0;
end;

end.
