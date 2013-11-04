--������Ų�

--MisDescBegin
x206006_g_ScriptId = 206006
x206006_g_MissionIdPre =32
x206006_g_MissionId = 33
x206006_g_MissionKind = 8
x206006_g_MissionLevel = 40
x206006_g_ScriptIdNext = {ScriptId = 206007 ,LV = 1 }
x206006_g_Name	="��³" 
x206006_g_Name2	="���Ų�" 

x206006_g_MissionName="������Ų�"
x206006_g_MissionInfo="    ����������С��ʱ�������#G���Ų�#W�����ɱ߾���ʱ��һ�����ز��ĵ��ǽ��������ģ����Ų��Ǹ��ɼ�˼������ġ���Ҳ��֪������������Ϊ��Ҫ���ӣ�����������̰���������ˣ�����Ӣ�ۣ�ȥ������ľ�����������������"  --��������
x206006_g_MissionTarget="    ѯ��#G���Ų�#R������#W���ӵ����顣"		
x206006_g_MissionComplete="    ����������һ������ģ�������������̫����Ҳ��������������ô�������أ����û�а����Ƶ��Ǹ����ϡ����ߣ�\n \n    ��Щ��������ų������û��ս������̰��������������������������Ĺ����ӣ������ҵĹ����������ô�ܳ�����ȻҪ�ݺ�������"					--�������npc˵���Ļ�
x206006_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x206006_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206006_g_RadioItemBonus={}

--MisDescEnd
x206006_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x206006_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206006_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206006_g_MissionId) > 0 then
		if (GetName(sceneId,targetId)==x206006_g_Name2) then
                     	BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x206006_g_MissionName)
			AddText(sceneId,x206006_g_MissionComplete)
		        AddMoneyBonus(sceneId, x206006_g_MoneyBonus)	
			EndEvent()
			DispatchMissionContinueInfo(sceneId, selfId, targetId, x206006_g_ScriptId, x206006_g_MissionId)
		end
        elseif x206006_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206006_g_MissionName)
                AddText(sceneId,x206006_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206006_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206006_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206006_g_ScriptId, x206006_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206006_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206006_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x206006_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206006_g_ScriptId, x206006_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x206006_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x206006_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206006_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
        	if IsMissionHaveDone(sceneId, selfId, x206006_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x206006_g_Name) then
        	        	if IsHaveMission(sceneId,selfId, x206006_g_MissionId)<= 0 then
        	            		return 1
        	        	end
        		elseif (GetName(sceneId,targetId)==x206006_g_Name2) then
			    	if IsHaveMission(sceneId,selfId, x206006_g_MissionId) > 0 then
			    		return 1
        	            	end
        		end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x206006_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x206006_g_MissionId, x206006_g_ScriptId, 1, 0, 0)
	AddText(sceneId,"��������"..x206006_g_MissionName) 
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end



--**********************************

--����

--**********************************

function x206006_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206006_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206006_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x206006_g_MissionId) >= 0 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206006_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206006_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206006_g_MissionId)
		AddExp(sceneId, selfId, x206006_g_ExpBonus)
		AddMoney(sceneId, selfId, x206006_g_MoneyBonus)
		for i, item in x206006_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end
	        CallScriptFunction( x206006_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	end
	
end



--**********************************

--ɱ����������

--**********************************

function x206006_OnKillObject(sceneId, selfId, objdataId)

end



--**********************************

--���������¼�

--**********************************

function x206006_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206006_OnItemChanged(sceneId, selfId, itemdataId)

end

