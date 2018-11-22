unit childpart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, ADODB;

type
  TForm_childpart = class(TForm)
    ads37: TADODataSet;
    ads37part_name: TStringField;
    ads37if_select: TBooleanField;
    ads37OPT_LOT_SIZE: TIntegerField;
    ads37LAYERS: TIntegerField;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ads37if_selectChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_childpart: TForm_childpart;

implementation

uses damo;

{$R *.dfm}

procedure TForm_childpart.FormActivate(Sender: TObject);
begin
self.ads37.Open;
end;

procedure TForm_childpart.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (ads37.RecNo=ads37.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
end;

procedure TForm_childpart.ads37if_selectChange(Sender: TField);
begin
if Sender.Value=False then
 label1.Caption:=IntToStr(strtoint(label1.Caption)-1)
else
 label1.Caption:=IntToStr(strtoint(label1.Caption)+1);

if strtoint(label1.Caption)>0 then
 Button1.Enabled:=True
else
 Button1.Enabled:=false;
end;

end.
